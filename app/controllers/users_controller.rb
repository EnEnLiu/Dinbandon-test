class UsersController < ApplicationController

  skip_before_action :check_login

  def login
    @user = User.new
  end

  def sign_up
    @user = User.new
    #render :sign_up
  end

  def sign_in
    #查資料庫
    #select * from users
    #where email = ? and password = ?
    #可以拿下面那個隱藏的方法
    user = User.find_by(email: user_params[:email],
                        password: user_params[:password])

    if user
      session[:ccc9527] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def registration
    user = params[:user]
    #新增使用者 
    @user = User.new(user_params)

    if @user.save
        #成功 & 幫登入
        session[:ccc9527] = @user.email
      redirect_to '/'
    else
        #失敗 但幫忙留住資料 讓資料可以重複使用
      render :sign_up
    end
  end

  def logout
    session[:ccc9527] = nil
    redirect_to root_path
  end


  private 
  def user_params
    #使用strong parameters
    params.require(:user).permit(:email, 
                                 :password, 
                                 :password_confirmation)
    #=params[:user]

    #原始清洗方法
    #u = User.new
    #u.email = user[:email]
    #u.password = user[:password]
  end

end
