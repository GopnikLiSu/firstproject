class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  def admins
    @users = User.order(:created_at).where.not(id: current_user.id).page(params[:page])
  end

  def change_suspended
      #You need to REQUIRE ADMIN to use this method!
      user = User.where(:id => params["user_id"]).last
      user.suspended = params['suspended'] || false
      user.save!

      redirect_to '/admins'
  end

  def require_admin!
    unless current_user.admin?
      redirect_to '/'
    end
  end

end
