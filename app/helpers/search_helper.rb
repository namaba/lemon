module SearchHelper
  def good(user)
    Like.find_by(user_id: current_user, target:user)
  end

  def user_image(image)
    if image.present?
      image_tag image, class: "img-radius"
    else
      image_tag 'default', class: "img-radius"
    end
  end
end
