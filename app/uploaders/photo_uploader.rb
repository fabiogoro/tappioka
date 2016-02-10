# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    return model.name
  end

  version :thumbnail do
    resize_to_fill(120, 120)
  end

  def default_url(*args)
    "http://res.cloudinary.com/do7esei9e/image/upload/c_fill,h_120/v1455142712/default.png"
  end
end
