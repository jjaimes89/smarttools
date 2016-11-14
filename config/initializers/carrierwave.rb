CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS', 
    :aws_access_key_id      => 'AWS_ID', 
    :aws_secret_access_key  => 'AWS_PASS', 
    :region                 => 'us-west-2'
  }
  config.fog_directory  = 'smartools-repo'
  config.fog_public     = true 
  config.storage = :fog
end
