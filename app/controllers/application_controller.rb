class ApplicationController < ActionController::Base
  before_action :masquerade_user!
  before_action :user_suspended?

  def user_suspended?
    if current_user.present? && current_user.suspended
        sign_out_and_redirect(current_user)
    end
  end
end
