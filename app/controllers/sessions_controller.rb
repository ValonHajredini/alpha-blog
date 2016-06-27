class SessionsController < ApplicationController
  def new

  end
  def create
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      flash[:success]= "You have successfully loged in"
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "Wrong email or password"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end