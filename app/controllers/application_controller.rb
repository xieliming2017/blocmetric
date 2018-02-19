class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authentcate_user!

end
