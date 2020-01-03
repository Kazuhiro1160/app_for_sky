class ImgUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick


  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:

  #上限変更
  # process :resize_to_limit => [350, 350]

  #JPGで保存
  # process :convert => 'jpg'
  #
  #サムネイルを生成
  version :thumb, if: :is_thumb?
  version :thumb do
    process :resize_to_limit => [200, 200]
  end

  # jpg,jpeg,gif,pngのみ
  # def extension_white_list
  #   %w(jpg jpeg gif png mp4)
  # end

  def fix_exif_rotation_and_strip_exif
    manipulate! do |img|
      img.auto_orient
      img.strip
      img = yield(img) if block_given?
      img
    end
  end

  private
  def is_thumb?(img)
    img.content_type.include?("image/")
  end

  #ファイル名を変更し拡張子を同じにする
  # def filename
  #   super.chomp(File.extname(super)) + '.jpg'
  # end

  #日付で保存
  # def filename
  #   if original_filename.present?
  #     time = Time.now
  #     name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
  #     name.downcase
  #   end
  # end
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
