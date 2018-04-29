class ApplicationController < ActionController::Base
  include Services::Organization
  protect_from_forgery with: :exception

  # This should execute before any other before_action methods
  prepend_before_action :authenticate_user!
end
