module ImagesHelper

  def image_size(uploaded_image)
    ImageUtil.get_image_size(uploaded_image.image.url)
  end
end
