# Load the rails application

require File.expand_path('../application', __FILE__)
#Mime::Type.register "application/pdf", :pdf
# Initialize the rails application
class Date
  MONTHNAMES = [nil, 'Enero', 'Febrero', 'Marzo',     'Abril', 
'Mayo','Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre','Noviembre', 
'Diciembre' ]
end
QuanLyCongVan::Application.initialize!

