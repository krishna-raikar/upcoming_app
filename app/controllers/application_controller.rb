class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # function called after user signing in.
  # Redirect to organization creation page if one not created else to the welcome page.
  def after_sign_in_path_for(user)
    user.organization.nil? ? new_organization_path : root_path
  end

end
