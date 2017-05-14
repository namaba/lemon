class Admin::AnnouncementController < Admin
  before_action :announcement_users, only: [:create]
  before_action :announcement_params, only: [:create]
  before_action :find_announcement, only: [:destroy]


  def index
    @announcements = Announcement.all 
  end

  def create
    @users.each do |u|
      @announcement = Announcement.create(user_id: u, body: @body)
    end
    if @announcement.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @announcement.deleted!
    redirect_to :back
  end

  def all_destroy
    @current_user.announcements.update_all(status: :deleted)
    redirect_to :back
  end

  private
    
    def announcement_users
      @users = params[:announcement][:user_id]
      @body = params[:announcement][:body]
    end

    def announcement_params
      params.require(:announcement).permit(:user_id, :body)
    end

    def find_announcement
      @announcement = Announcement.find(params[:id])
    end

end
