class Guest::MurmurSmilesController < Guest
   before_action :find_smile, only: [:destroy]
  def create
    @smile = MurmurSmile.new(user_id: params[:user].to_i, murmur_id: params[:murmur].to_i)
    if @smile.save
      # 遷移先未定
      # redirect_to murmurs_path, notice: 'つぶやきました'
      redirect_to :back
    else
      render :new, notice: 'つぶやけませんでした'
    end
  end

  def destroy
    @smile.destroy
    redirect_to :back, notice: '削除しました'
  end

  private
  def find_smile
    @smile = MurmurSmile.find_by(user_id: params[:user].to_i, murmur_id: params[:id].to_i)
  end


end
