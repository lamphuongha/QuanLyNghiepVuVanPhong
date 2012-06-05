class TrangchuController < ApplicationController
  layout 'main'
  #http_basic_authenticate_with :name => "bangtam", :password => "bangtam"
  def index
    
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
      flash.now.alert = "Email hay mật khẩu đăng nhập không đúng"
      render "index"
      #redirect_to "#"
    end
  end
end
