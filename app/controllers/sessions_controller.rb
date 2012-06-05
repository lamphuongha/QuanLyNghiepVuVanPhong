class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => "Đăng nhập thành công!"
    else
      flash.now.alert = "Email hoặc mật khẩu đăng nhập không đúng"
      render "#"
      #redirect_to "#"
    end
  end
  
    def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Đăng xuất thành công!"
  end
  
end
