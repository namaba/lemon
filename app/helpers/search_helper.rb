module SearchHelper
  def good(user)
    like = Like.find_by(user_id: current_user, target:user)
    if like.blank?
      link_to 'イイね', likes_path(id: current_user, target: user), method: :post
    else
      'イイね済み'
    end
  end
end
