class Guest::UsersController < Guest

  def show
    @user = User.find(params[:id])
  end


end
