class Guest::MessagesController < Guest
  before_action :set_user, only: [:show]

  def index

  end

  def show
  end

  def create
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
