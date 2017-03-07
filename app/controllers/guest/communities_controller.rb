class Guest::CommunitiesController < Guest
  before_action :set_community, only: [:show]

  def index
    @communities = Community.all
  end

  def show

  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(community_params)
    if @community.save!
      redirect_to communities_path
    else
      redirect_to :back
    end
  end


  private
  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(
      :name,
      :user_id,
      :introduce,
      :image
      )
  end
end
