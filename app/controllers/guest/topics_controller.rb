class Guest::TopicsController < Guest
   before_action :set_community, only: [:new]
   before_action :set_topic, only: [:show, :chat, :update]
   before_action :set_topic_community, only: [:create]
   before_action :set_topic_chat_community, only: [:chat]


  def index
  end

  def show
    @chats = @topic.chats
    @topic_chat = TopicChat.new
  end

  def new
    @topic = @community.topics.new
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @topic = @community.topics.build(topic_params)
        if @topic.save!
          flash[:success] = "作成できました"
          redirect_to community_path(@community)
        end
      end
    rescue => e
      redirect_to :back, warning: "#{e.message}"
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    if @topic = @topic.update(topic_params)
      redirect_to :back, success: "更新できました"
    else
      redirect_to :back, danger: "更新できませんでした"
    end
  end
  def destroy
    topic = Topic.find(params[:id])
    if topic.draft!
      redirect_to :back
    end
  end

  def chat
    @chat = @topic.chats.build(chat_params)
    if @chat.save!
      redirect_to community_path(@community), success: "作成できました"
    else
      redirect_to :back, danger: "作成できませんでした"
    end
  end

  private

  def topic_params
    params.require(:topic).permit(
      :community_id,
      :user_id,
      :title,
      :body
      )
  end

  def chat_params
    params.require(:topic_chat).permit(
      :community_id,
      :user_id,
      :topic_id,
      :body,
      :image
      )
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

  def set_topic_community
    @community = Community.find(params[:topic][:community_id])
  end

  def set_topic_chat_community
    @community = Community.find(params[:topic_chat][:community_id])
  end

end
