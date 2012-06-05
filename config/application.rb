require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rubygems'
require 'Spreadsheet'
#require 'pdfkit'
Date::MONTHNAMES=[nil,"tháng 1","tháng 2","tháng 3","tháng 4","tháng 5","tháng 6","tháng 7","tháng 8","tháng 9","tháng 10","tháng 11","tháng 12"]
if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
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
module QuanLyCongVan
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    # config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    #config.action_view.JavaScript_expansions[:defaults] = %w(jquery rails application)
    
    require 'pdfkit'    
    config.middleware.use PDFKit::Middleware
 #   PDFKit.configure do |config|
 #     config.wkhtmltopdf = `which wkhtmltopdf`.to_s.strip
      #config.wkhtmltopdf = 'which wkhtmltopdf'.gsub(/\n/, '')
 #     config.wkhtmltopdf = 'C:/jruby-1.6.5/bin/wkhtmltopdf'
      
 #   end
#    PDFKit.configure do |config|
#    config.wkhtmltopdf = "C:/Program\ Files\/wkhtmltopdf/wkhtmltopdf.exe"
#    end
    
    class Date
      MONTHNAMES = [nil, 'Enero', 'Febrero', 'Marzo',     'Abril', 
    'Mayo','Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre','Noviembre', 
    'Diciembre' ]
    end
    
  end
end
