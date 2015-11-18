if Rails.env.production?
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIZZNWNTJJOVQYMCQ',                        # required
    aws_secret_access_key: '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',                        # required
   # region:                'us-west-1',                  # optional, defaults to 'us-east-1'
   # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'images'                          # required
  #config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end