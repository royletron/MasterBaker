require 'digest'
require 'base64'
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
     @user = User.find(params[:id])
     render :show
  end

  def show
    @user = User.find(params[:id])
    @title = @user.username;
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    confirmation = Base64::encode64(@user.email)
    @user.confirm_code = confirmation
    respond_to do |format|  
      if @user.save
        UserMailer.welcome_email(@user).deliver
        flash[:notice] = "Account created, go check your emails!"
        format.html { redirect_to root_path}
        format.xml  { head :ok }
      else  
        format.html { render 'new' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }             
      end
    end
  end
  
end