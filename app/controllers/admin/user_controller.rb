class Admin::UserController < Admin
  before_action :new_announcement, only: [:index, :premium_users, :canceled_users, :men, :women, :paying_users, :normal_users, :no_match ]

  def index
    @profile = UserProfile.all
    @users = User.all
    @announcement = Announcement.new
  end

  def premium_users
    @users = UserProfile.premium
  end

  def canceled_users
    @users = UserProfile.canceled
  end

  def men
    @users = UserProfile.valid.men
    render "index"
  end

  def women
    @users = UserProfile.valid.women
    render "index"
  end

  def paying_users
    @users = UserProfile.valid.paying_users
    render "index"
  end

  def normal_users
    @users = UserProfile.normal
    render "index"
  end

  def no_match
    @users = UserProfile.where.not(id: UserPartnership.select('user_id'))
    render "index"
  end

  private
    def new_announcement
     @announcement = Announcement.new 
    end

end
