# frozen_string_literal: true

class ImageUtil

  def self.resize_uploaded_image(uploaded_image, width, height)
    return unless uploaded_image.image
    return unless uploaded_image&.image&.url.present?
    img = resize_image(uploaded_image.image.url, width, height)
    return unless img

    file = File.write_tempfile 'resized.jpg', ""
    img.write(file.path)
    uploaded_image.image = File.open(file.path)
    uploaded_image.save

    file.unlink
  end

  def self.resize_image(url, width, height)
    image = try_read_image(url)
    return unless image
  	image.change_geometry("#{width}^x#{height}^") { |cols, rows, img| img.resize!(cols, rows) }
  rescue StandardError
    nil # return nil if we can't resize image
  end

  def self.try_read_image(image_url)
    content = open_url image_url
    return nil unless content

    Magick::Image.from_blob(content.read).first
  rescue StandardError
    nil
  end
  
  def self.open_url(image_url)
    open(image_url)
  end

  def self.get_image_size(image_url)
    image = try_read_image image_url 
    "#{image.columns}*#{image.rows}"
  end

  def self.image_width(image_url)
    image = try_read_image image_url 
    image.columns
  end

  def self.image_height(image_url)
    image = try_read_image image_url 
    image.rows
  end
end
