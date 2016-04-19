# /app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  
  helper_method :current_user_session, :current_user

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def require_user
      unless current_user
        store_location
        redirect_to(sign_in_path, notice: 'You must be sign in to access this page') and return false
      end
    end

    def require_no_user
      if current_user
        store_location
        redirect_to(root_path, notice: 'You must sing out to access this page') and return false
      end
    end

    def user_not_authorized
      store_location
      redirect_to(sign_in_path, notice: 'You must be sign in to access this page') and return false
    end
end
