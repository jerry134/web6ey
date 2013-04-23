CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => '420680742092',
    :google_storage_secret_access_key => '00b4903a97ced2c5881f94352fb3a559db7b3532d1038229c7ae369e890de609'
  }
  config.fog_directory = 'web6'
end