class Guest::SearchesController < Guest


  def index
    @users = User.all
  end

  def show
  end
end
