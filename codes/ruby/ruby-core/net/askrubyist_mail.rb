require 'net/smtp'

html_message = <<MESSAGE_END
From: James Zhan <hello@world.com>
To: Zizhi Zhan <zizhizhan@gmail.com>
MIME-Version: 1.0
Content-type: text/html
Subject: SMTP Send Mail Title.

This is an e-mail message to be sent in HTML format

<b>This is HTML message.</b>
<h1>This is from AskRubyist</h1>
MESSAGE_END

smtp = Net::SMTP.new 'smtpout.asia.secureserver.net', 25
#smtp.enable_starttls

smtp.start('askrubyist.org', "admin@askrubyist.org", "adminaskrubyist", :login) do|smtp|  
  from = "admin@askrubyist.org"  
  to = ["zhiqiangzhan@gmail.com", "zizhizhan@gmail.com"]

  smtp.ready(from, to){|f|
    f.puts 'From: hello@world.com'
    f.puts 'To: zizhizhan@gmail.com'
    f.puts 'Subject: Send Email Title'
    f.puts
    f.puts 'Send Email Body From Godaddy Hello World.'
  }

  smtp.send_message html_message, from, to
  smtp.finish
end