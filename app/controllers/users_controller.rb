require 'digest'
class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def edit
     @user = User.find(params[:id])
     @title = "Edit" + @user.username;
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
    confirmation = (0...8).map{65.+(rand(25)).chr}.join
    @user.confirmcode = confirmation
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
  
  def update
    @user = User.find(params[:user][:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated."
      redirect_to user_path(@user)
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  private
    
    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_user
      if params[:id].nil? 
        @user = User.find(params[:user][:id])
      else
        @user = User.find(params[:id]) 
      end
      redirect_to(root_path) unless current_user?(@user)
    end
end