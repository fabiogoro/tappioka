class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    model.name
  end

  version :thumbnail do
    resize_to_fill(120, 120)
  end

  def default_url
    'http://res.cloudinary.com/do7esei9e/image/upload/c_fill,h_120/v1455142712/default.png'
  end
end
