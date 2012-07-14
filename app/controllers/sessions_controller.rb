class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create 
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:warning] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      if user.confirmed == 0
        flash.now[:warning] = "That account hasn't been confirmed."
        @title = "Sign in"
        render 'new'
      else
        sign_in user
        redirect_back_or user
      end
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
