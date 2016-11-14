Rails.application.configure do
 
  config.cache_classes = false

  
  config.eager_load = false

 
  config.consider_all_requests_local = true
			    
ENV["SES_SMTP_USERNAME"] = "SMTP_USERNAME"
ENV["SES_SMTP_PASSWORD"] = "PASS_SMTP"

 
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

    config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

   config.active_support.deprecation = :log

 
   config.assets.debug = true

  
  config.assets.quiet = true

  
 config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'email-smtp.us-east-1.amazonaws.com',
    port:                 587, #solo funciona con ese
     user_name:           ENV["SES_SMTP_USERNAME"],
    password:             ENV["SES_SMTP_PASSWORD"],
    authentication:       :login,
    enable_starttls_auto: true  }
  
 endpoint    = "stools.judgr1.cfg.use1.cache.amazonaws.com:11211"
 elasticache = Dalli::ElastiCache.new(endpoint)
 config.cache_store = :dalli_store, elasticache.servers, {:expires_in => 1.day, :compress => true}

end
