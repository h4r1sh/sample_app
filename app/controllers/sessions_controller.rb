class SessionsController < ApplicationController
  def new
  end

  def delete
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid email or password"
      render 'new'
    end
  end
  
end