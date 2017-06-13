class Guest::CommunitiesController < Guest
  before_action :set_community, only: [:show, :join]

  def index
    @communities = Community.all.page(params[:page]).per(10)
    @community = Community.new
    @pickup_communities = Community.where(status: 2).limit(5)
    @my_communities = current_user.my_community.page(params[:page]).per(20)
  end

  def show
    @users = User.all
    @topics = @community.topics
    @topic = Topic.new
    @topic_chat = TopicChat.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(community_params)
    if @community.save!
      redirect_to communities_path, notice: "作成できました"
    else
      redirect_to :back, notice: "作成できませんでした"
    end
  end

  def my_communities
    @my_communities = current_user.my_community.page(params[:page]).per(20)
    @community = Community.new
  end

  def detail
    @community = Community.find(params[:id])
    @communities = Community.all
    @users = User.all
  end

  def join
    begin
      ActiveRecord::Base.transaction do
        current_user.join_communities.create(community: @community)
        redirect_to @community
      end
    rescue => e
    end
  end

  def comment_new

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

  def join_community_params
    params.require(:community).permit(
      :name,
      :user_id,
      :introduce,
      :image
      )
  end
end
