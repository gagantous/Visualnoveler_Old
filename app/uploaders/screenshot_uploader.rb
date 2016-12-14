# encoding: utf-8

class ScreenshotUploader < CarrierWave::Uploader::Base
  include CarrierWave::ImageOptimizer
  include CarrierWave::MiniMagick

  process resize_to_limit: [1000,1000]
  process :optimize
  
  if Rails.env.production?
      storage :fog
  elsif Rails.env.development?
      storage :file
  end
  # storage :fog
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    
  end

    def extension_white_list
     %w(jpg jpeg gif png)
    end

  #Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [400, 400]
  end


end
