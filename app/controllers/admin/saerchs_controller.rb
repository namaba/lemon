class Admin::SearchsController < ApplicationController

  def men
    @users = UserProfile.where(sex: 1)
    render :template => "admin/user/index"
  end

  def women
    @users = UserProfile.where(sex: 2)
    redirect_to :back
  end

  def paying_users
    @users = UserProfile.where.not(plan: ['canceled', 'normal'])
    render :back
  end

  def normal_users
    @users = UserProfile.normal
    render :back
  end

end
