# encoding: utf-8

class ImagenUploader < CarrierWave::Uploader::Base


def content_type_whitelist
    /image\//
  end
 
#storage :file
storage :fog
 
include CarrierWave::MimeTypes
  process :set_content_type
  def store_dir
    "uploads/imagen/#{model.class.to_s.underscore}"

 
  end

 

end
