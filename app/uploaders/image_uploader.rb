# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader:
  # storage :file
   storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  
  version :thumb do
    process :resize_to_fill => [282, 282]
  end
  version :small do
    process :resize_to_fill => [361, 241]
  end
  # Index page for users
  version :user_image do
     process :resize_to_fill => [134, 134]
  end
  # On index page of events
  version :event_image do
    process :resize_to_fill=> [300, 171]
  end
  
end
