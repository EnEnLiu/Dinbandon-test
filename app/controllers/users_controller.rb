class UsersController < ApplicationController

  def login
    
  end

  def sign_up
  end

  def registration
    if params[:user][:password] == params[:user][:password_confirm]
      redirect_to '/login'
    else
      redirect_to '/sign_up'
    end
  end

end