require 'action_mailer'

deliver_method = :smtp
smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :user_name => "zizhizhan",
  :password => "my@830507",
  :authentication => "plain",
  :enable_starttle_auto => true
}

class Notifier < ActionMailer::Base
  default :from => 'zhiqiangzhan@gmail.com', :return_path => 'zhiqiangzhan@gmail.com'

  def welcome()
    mail(:to => "James Dage<zhiqiangzhan@gmail.com>", :bcc => ["zhiqiangzhan@example.com", "James Zhan <zizhizhan@gmail.com>"], 
      :subject => "This is a test.").deliver
  end
end

begin
  Notifier.welcome.deliver # sends the email
  #mail = Notifier.welcome(david)  # => a Mail::Message object
  #mail.deliver                    # sends the email
  puts "Done."
rescue Errno::ECONNREFUSED => e
  puts e.message
end



