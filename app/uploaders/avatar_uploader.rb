# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    ActionController::Base.helpers.asset_path('fallback/default.png')
  end

  process resize_to_fill: [200, 200]
  process convert: 'jpg'

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename
  end
end
