class Guest::PagesController < Guest
  # before_action :authenticate_user!, only: [:show]
  layout 'application'

  def index
    
  end

  def welcome
  end
end
