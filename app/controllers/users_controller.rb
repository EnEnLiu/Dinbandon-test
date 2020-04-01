class UsersController < ApplicationController

  def login
  end

  def sign_up
    @user = User.new
    #render :sign_up

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
