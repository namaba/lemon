class Guest::ReportsController < Guest
  
  def index
    # 通報済みユーザ一覧
    @done_report = User.done_report(current_user).page(params[:page]).per(6)
  end

  def create
    # 通報する
    @report = Report.new(report_params)
    if @report.save
      sleep(3)
      flash[:success] = "Thanks report"
      # redirect_to search_url
      redirect_to :back
    else
      sleep(3)
      flash[:success] = "File report"
      redirect_to :back
    end
  end

  private
  
  def report_params
    params.require(:report).permit(
      :user_id,
      :user_name,
      :target_id,
      :target_name,
      :body
    )
  end
  
end
