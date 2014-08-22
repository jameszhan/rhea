require 'net/imap'

imap = Net::IMAP.new('imap.gmail.com', port: 993, ssl: true)
#imap.authenticate('LOGIN', 'muchen.zhan', 'my@830507')
imap.login('zizhizhan', 'my@830507')

imap.examine('INBOX')
imap.search(["RECENT"]).each do |message_id|
  envelope = imap.fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]
  puts "#{envelope.from[0].name}: \t#{envelope.subject}"
end

imap.search(["SUBJECT", "hello"]).each do |message_id|
  envelope = imap.fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]
  puts "#{envelope.from[0].name}: \t#{envelope.subject}"
end

folder = "INBOX"
imap.select(folder)

imap.search(["FROM", "gmail.com"]).each do |msg_id|
  msg = imap.fetch(msg_id, "(UID RFC822.SIZE ENVELOPE BODY[TEXT])")[0]
  body = msg.attr["BODY[TEXT]"]
  puts "#{body}"

  env = imap.fetch(msg_id, "ENVELOPE")[0].attr["ENVELOPE"]
  puts "#{env.from[0].name}: \t#{env.subject}"
end

imap.logout
imap.disconnect