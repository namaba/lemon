class Guest::TopicsController < Guest
   before_action :set_community, only: [:new]
   before_action :set_topic_community, only: [:create]
   before_action :set_topic, only: [:show]


  def index
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = @community.topics.build(topic_params)
    if @topic.save!
      redirect_to @community, notice: "作成できました"
    else
      redirect_to :back, notice: "作成できませんでした"
    end
  end

  def edit
  end

  def destroy
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

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

  def set_topic_community
    @community = Community.find(params[:topic][:community_id])
  end

end
