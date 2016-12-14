# encoding: utf-8

class NewsUploader < CarrierWave::Uploader::Base
  include CarrierWave::ImageOptimizer
  include CarrierWave::MiniMagick
  storage :file
  process resize_to_limit: [800,565]
  process :optimize
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/"
    
  end

    def extension_white_list
     %w(jpg jpeg gif png)
    end



end
