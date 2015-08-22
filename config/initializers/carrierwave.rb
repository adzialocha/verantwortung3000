CarrierWave.configure do |config|

  config.fog_provider = 'fog/aws'

  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_ID'],
    aws_secret_access_key: ENV['AWS_ACCESS_KEY'],
    region:                'eu-central-1'
  }

  config.fog_directory  = 'darmstadt3000'
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

end
