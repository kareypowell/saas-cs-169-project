class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :set_current_user

  # protected

  # 	def set_current_user
  # 		# we exploit the fact that find_by_id(nil) return nil
  # 		@current_user ||= Moviegoer.find_by_id(session[:user_id])
  # 		redirect_to login_url and return unless @current_user
  # 	end

  private

	  def current_user
	  	@current_user ||= Moviegoer.find(session[:user_id]) if session[:user_id]
	  end
	  helper_method :current_user
end
