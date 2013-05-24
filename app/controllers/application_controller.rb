class ApplicationController < ActionController::Base
  include AuthHelper

  before_filter :authenticate_user!

  protect_from_forgery
  
  helper_method :current_user, :signed_in?
end
