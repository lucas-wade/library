=begin

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        # Configuration for Amazon S3
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end

=end

CarrierWave.configure do |config|
  config.permissions = 0644
  config.directory_permissions = 0700
  config.storage = :file
  config.root = Rails.root
end
