class Guest::MurmursController < Guest
  before_action :set_murmur, only: [:show, :edit, :update, :destroy]
  before_action :murmur_params, only: [:create, :update]

  def index
    @murmurs = Murmur.all
  end

  def new
    @murmur = Murmur.new
  end

  def create
    @murmur = Murmur.new(murmur_params)
    if @murmur.save
      # 遷移先未定
      redirect_to murmurs_path, notice: 'つぶやきました'
    else
      render :new, notice: 'つぶやけませんでした'
    end
  end

  def edit
    @murmur = Murmur.find(params[:id])
  end

  def update
    if @murmur.update(murmur_params)
      # 遷移先未定
      redirect_to murmurs_path, notice: '編集しました'
    else
      render :edit, notice: '編集できませんでした'
    end
  end

  def destroy
    @murmur.draft!
    redirect_to :back, notice: '削除しました'
  end

  private
  def set_murmur
    @murmur = Murmur.find(params[:id])
  end

  def murmur_params
    params.require(:murmur).permit(
      :user_id,
      :body,
      :image,
      :status
      )
  end
end