class ConfirmController < ApplicationController

  def account
    @user = User.find_by_confirmcode_and_email(params[:code], params[:email])
    @user.confirmed = true;
    @user.save
    @title = "Confirm"
  end
  
  
end