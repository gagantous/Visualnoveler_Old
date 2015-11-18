# encoding: utf-8

class ScreenshotUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.name}/#{mounted_as}/#{model.id}"
    
  end

    def extension_white_list
     %w(jpg jpeg gif png)
    end

  #Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [400, 400]
  end


end
