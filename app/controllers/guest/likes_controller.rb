class Guest::LikesController < Guest
  def index
    @users = User.like_me(current_user)

  end

  def show
  end

  def create
    if Like.create(user_id: params[:id], target_id: params[:target], like: 1)
      redirect_to :back, notice: "イイねしました!"
    else
      redirect_to :back, notice: "イイねできませんでした"
    end
    # redirect_to user_search_path(id: params[:id], user_id: params[:target])
  end
end
