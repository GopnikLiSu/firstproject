class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  def admins
    @users = User.order(:created_at).where.not(id: current_user.id).page(params[:page])
  end

  def banhammer
    
  end

  def require_admin!
    unless current_user.admin?
      redirect_to '/'
    end
  end

end
