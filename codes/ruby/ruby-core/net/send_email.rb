require 'net/smtp'

html_message = <<MESSAGE_END
From: James Zhan <zhiqiangzhan@gmail.com>
To: Zizhi Zhan <zizhizhan@gmail.com>
MIME-Version: 1.0
Content-type: text/html
Subject: SMTP Send Mail Title.

This is an e-mail message to be sent in HTML format

<b>This is HTML message.</b>
<h1>This is headline.</h1>
MESSAGE_END

smtp = Net::SMTP.new 'smtp.gmail.com', 587
smtp.enable_starttls

smtp.start('gmail.com', 'muchen.zhan', 'my@830507', :login) do|smtp|  
  from = "zhiqiangzhan@163.com"  
  to = ["zhiqiangzhan@gmail.com", "zizhizhan@gmail.com"]

  smtp.ready(from, to){|f|
    f.puts 'From: zhiqiangzhan@gmail.com'
    f.puts 'To: zizhizhan@gmail.com'
    f.puts 'Subject: Send Email Title'
    f.puts
    f.puts 'Send Email Body.'
  }

  smtp.send_message html_message, from, to
  smtp.finish
end