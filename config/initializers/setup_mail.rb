ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = false
ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "www.google.com",  
  :user_name            => "ranipriya926@gmail.com",  
  :password             => "ramprabu38",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  