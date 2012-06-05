# Load the rails application

require File.expand_path('../application', __FILE__)
#Mime::Type.register "application/pdf", :pdf
# Initialize the rails application
class Date
  MONTHNAMES = [nil, 'Enero', 'Febrero', 'Marzo',     'Abril', 
'Mayo','Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre','Noviembre', 
'Diciembre' ]
end
#require "smtp_tls"
#ActionMailer::Base.raise_delivery_errors = false
#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.smtp_settings = {
#:address => "smtp.gmail.com",
#:port => 587,
#:domain => 'gmail.com',
#:user_name => "bangtamha@gmail.com",
#:password => "bangtamha011090",
#:authentication => :plain
#}
QuanLyCongVan::Application.initialize!

