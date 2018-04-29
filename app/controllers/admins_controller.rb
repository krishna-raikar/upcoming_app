class AdminsController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin

  # GET /admins
  def index
    @organizations = Organization.includes(:user)
  end

  private

  def authenticate_admin
    unless current_user.is_admin
      flash[:notice] = 'You do not have permission to access this page/view.'
      redirect_to root_path
    end
  end
end
