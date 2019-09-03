class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, :if =>lambda{ params[:authenticity_token].present? && params[:authenticity_token] == 'skip' }
  # skip_before_action :logged_in_user, :if =>lambda{ params[:authenticity_token].present? && params[:authenticity_token] == 'skip' }, raise: false
  include SessionsHelper

  def hello
    render html: 'hello, world!'
  end

  private

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
