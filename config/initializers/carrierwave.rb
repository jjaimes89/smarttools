CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS', 
    :aws_access_key_id      => 'AKIAI6C2BGIS5PPLPNKA', 
    :aws_secret_access_key  => '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', 
    :region                 => 'us-west-2'
  }
  config.fog_directory  = 'smartools-videosd'
  config.fog_public     = true 
  config.storage = :fog
end