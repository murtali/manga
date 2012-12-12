class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :authorize

  delegate :allow?, :to => :current_permission
  helper_method :allow?
  

  private

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize
  	puts params
    if !current_permission.allow?(params[:controller], params[:action])
      redirect_to mangas_path, alert: "Not authorized."
  	end
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
