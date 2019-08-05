# class maps to table
# objects map to records
# following 2 lines is we teach activerecord to do that mapping
# NAMING CONVENTIONS
# singular for model name
# plural for table name 

require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'fog'

CarrierWave.configure do |config|
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false

  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['AWS_APIKEY'],
    :aws_secret_access_key => ENV['AWS_APISKEY'],
    :region                => 'ap-southeast-2' # sydney
    # :host   => 's3-ap-southeast-2.amazonaws.com'
  }

  config.fog_provider = 'fog/aws'
  config.fog_directory    = ENV['AWS_S3']
  
  # config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
end

class ImageUploader < CarrierWave::Uploader::Base
  storage :fog
end


class Picture < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image_file, ImageUploader
end
