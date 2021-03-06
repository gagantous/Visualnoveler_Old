# encoding: utf-8

class NewsFeaturedUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [1000,565]
  storage :file
  # storage :fog
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/"
    
  end

    def extension_white_list
     %w(jpg jpeg gif png)
    end
  version :thumb do
    process :resize_to_fill => [400,285]
  end


end
