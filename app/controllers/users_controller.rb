class UsersController < ApplicationController
  #http_basic_authenticate_with :name => "bangtam", :password => "bangtam"
  load_and_authorize_resource
  def index
    @users = User.paginate(:page => params[:page], :order => "id DESC")
      respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
      format.xml
    end
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  def update
    @user = User.find(params[:id])
    @roles = Role.find :all
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'Cập nhật thông tin thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
