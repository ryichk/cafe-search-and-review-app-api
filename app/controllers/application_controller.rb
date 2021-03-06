class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :detect_locate

  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  # rescue_from Exception, with: :render_500


  def after_sign_out_path_for(resource)
      '/users/sign_in'  # サインアウト後のリダイレクト先URL
  end

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end

    private
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar_url, :agreement])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar_url])
      end

      def  detect_locate
        I18n.locale = request.headers['Accept-Language'].scan(/\A[a-z]{2}/).first
      end
end
