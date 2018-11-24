class Guest::CommunitiesController < Guest
  before_action :set_community, only: [:show, :edit, :update, :join, :detail, :member_list, :ban_member, :releace_member]

  def index
    @communities = Community.all.page(params[:page]).per(10)
    @community = Community.new
    @pickup_communities = Community.where(status: 2).limit(5)
    banned_communy_ids = current_user.join_communities.is_banned.pluck(:community_id)
    @my_community_ids = current_user.my_community.ids - banned_communy_ids
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

  def edit
  end

  def update
    if @community.update(community_params)
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
      redirect_to @community, success: "参加しました"
    else
      redirect_to :back, warning: "参加できませんでした"
    end
  end

  def comment_new

  end

  def member
    @member = User.find params[:member_id]
  end

  def member_list
    @users = @community.community_members.page(params[:page]).per(16)
  end

  def ban_member
    @user_community = @community.user_communities.find_by(user_id: user_community_params[:user_id])
    if @user_community.is_banned!
      redirect_to member_list_community_path(@community), success: '追放しました'
    else
      redirect_to member_list_community_path(@community), warning: '追放できませんでした'
    end
  end

  def releace_member
    @user_community = @community.user_communities.find_by(user_id: user_community_params[:user_id])
    if @user_community.not_ban!
      redirect_to member_list_community_path(@community), success: '追放解除しました'
    else
      redirect_to member_list_community_path(@community), warning: '追放解除できませんでした'
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
      :image,
      :invitational,
      )
  end

  def user_community_params
    params.require(:user_community).permit(
      :user_id,
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
