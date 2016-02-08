# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    return model.name
  end

  version :thumbnail do
    resize_to_fill(120, 120)
  end
end
