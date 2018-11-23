class Guest::CommunitiesController < Guest
  before_action :set_community, only: [:show, :join, :detail]

  def index
    @communities = Community.all.page(params[:page]).per(10)
    @community = Community.new
    @pickup_communities = Community.where(status: 2).limit(5)
    @my_community_ids = current_user.my_community.ids
  end

  def show
    @community_members = @community.community_members
    @topics = @community.topics.published.order('updated_at DESC')
    @topic = Topic.new
    @topic_chat = TopicChat.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(community_params)
    if @community.save!
      @community.user_communities.create(user_id: current_user.id)
      redirect_to @community, success: "コミュニティが作成されました！"
    else
      redirect_to :back, warning: "コミュニティが作成できませんでした"
    end
  end

  def my_communities
    @my_communities = current_user.my_community.page(params[:page]).per(20)
    @community = Community.new
  end

  def detail
    @community_members = @community.community_members
    @orner = @community.user_communities.is_orner.first.user
  end

  def join
    user_community = current_user.join_communities.new(community_id: @community.id, is_orner: true)
    if user_community.save
      redirect_to @community, notice: "参加しました"
    else
      redirect_to :back, alert: "参加できませんでした"
    end
  end

  def comment_new

  end

  def member
    @member = User.find params[:member_id]
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
      :image,
      :invitational,
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
