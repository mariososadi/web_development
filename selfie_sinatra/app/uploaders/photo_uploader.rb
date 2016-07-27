class PhotoUploader < CarrierWave::Uploader::Base
  # ...
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_fill: [200,200]
  end

  def store_dir
    'public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}'
  end

  storage :file
 
 def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
