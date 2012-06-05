class PasswordResetsController < ApplicationController
    #load_and_authorize_resource 
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
#    UserMailer.password_reset(user).deliver
#    user = User.find_by_email(params[:email])
#    if user && user.email == current_user.email
#      user.send_password_reset
      redirect_to root_url, :notice => "Email thay đổi mật khẩu đã được gửi."
#    else
#      flash.now.alert = "Email không đúng. Vui lòng nhập lại email"
#      render "new"
#    end
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Thay đổi mật khẩu quá thời hạn."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Mật khẩu đã được thay đổi."
    else
      render :edit
    end
  end

  
end
