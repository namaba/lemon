class Guest::MurmurCommentsController < Guest
  before_action :comment_params, only: [:create, :update]
  before_action :set_murmur, only: [:new]


  def new
    @murmur_comment = MurmurComment.new
  end

  def create
    @murmur_comment = MurmurComment.create(comment_params)
    if @murmur_comment.save
      # 遷移先未定
      redirect_to :back, notice: 'つぶやきました'
    else
      render :new, notice: 'つぶやけませんでした'
    end
  end

  private
  def comment_params
    params.require(:murmur_comment).permit(
      :user_id,
      :murmur_id,
      :comment,
      :status
      )
  end

  def set_murmur
    @murmur = Murmur.find(params[:id])
  end


end
