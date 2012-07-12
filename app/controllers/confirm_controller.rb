class ConfirmController < ApplicationController

  def account
    @user = User.find_by_confirmcode_and_email(params[:code], params[:email])
    @user.update_attribute(:confirmed, 1)
    @title = "Confirm"
  end
  
  
end