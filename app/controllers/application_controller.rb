class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, 
              with: :record_not_found

  before_action :check_login
  
  helper_method :current_user

  private
  def check_login
    unless current_user
      #if controller_name != "users"
        redirect_to login_path ,notice: "請先登入"
      #end
    end
  end

  def record_not_found
    render file: 'public/404.html',
           status: 404,
           layout: false
    #redirect_to items_path, notice: '找嘸!'
  end

  def current_user
    # session[:ccc9527]
    User.find_by(id: session[:ccc9527])
  end

end
