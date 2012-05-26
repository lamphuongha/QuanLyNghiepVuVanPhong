class CovanhoctapsController < ApplicationController
#  layout 'main'
  load_and_authorize_resource 
   # GET /covanhoctaps
  # GET /covanhoctaps.json
  def index
    if params[:search]
        @covanhoctaps=Covanhoctap.joins(:giangvien,:lop).search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @covanhoctaps = Covanhoctap.paginate(:page => params[:page], :order => "id DESC")
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @covanhoctaps }
      format.js
    end
  end

  # GET /covanhoctaps/1
  # GET /covanhoctaps/1.json
  def show
    @covanhoctap = Covanhoctap.find(params[:id])
      respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @covanhoctap }
      format.xml
    end
  end

  # GET /covanhoctaps/new
  # GET /covanhoctaps/new.json
  def new
    @covanhoctap = Covanhoctap.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @covanhoctap }
      format.xml
    end
  end

  # GET /covanhoctaps/1/edit
  def edit
    @covanhoctap = Covanhoctap.find(params[:id])
    #raise CanCan::AccessDenied.new("Bạn không thể truy cập trang này.", :read, @covanhoctap)
    #unauthorized! if cannot? :update, @covanhoctap
    
    
  end

  # POST /covanhoctaps
  # POST /covanhoctaps.json
  def create
    @covanhoctap = Covanhoctap.new(params[:covanhoctap])
    @giangviens = Giangvien.all
    @covanhoctap.giangviens = Giangvien.find(params[:giangvien_id]) if params[:giangvien_id]
    @lops=Lop.all
    @covanhoctap.lops = Lop.find(params[:lop_id]) if params[:lop_id]
    respond_to do |format|
      
      if @covanhoctap.save
        format.html { redirect_to @covanhoctap, :notice => 'Thêm cố vấn học tập thành công.' }
        
        format.json { render :json => @covanhoctap, :status => :created, :location => @covanhoctap }
      
      else
        format.html { render :action => "new" }
        format.json { render :json => @covanhoctap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /covanhoctaps/1
  # PUT /covanhoctaps/1.json
  def update
    @covanhoctap = Covanhoctap.find(params[:id])

    respond_to do |format|
      if @covanhoctap.update_attributes(params[:covanhoctap])
        format.html { redirect_to @covanhoctap, :notice => 'Cập nhật cố vấn học tập thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @covanhoctap.errors, :status => :unprocessable_entity }
      end
    end
  end
 # DELETE /covanhoctaps/1
  # DELETE /covanhoctaps/1.json
  def destroy
    @covanhoctap = Covanhoctap.find(params[:id])
    @covanhoctap.destroy
    
    respond_to do |format|
      format.html { redirect_to covanhoctaps_url }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:search]
        @covanhoctaps=Covanhoctap.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
    else
        @covanhoctaps=Covanhoctap.search_with_permission(params[:giangvien_id],params[:lop_id],params[:HocKy],params[:NamHoc]).paginate(:page => params[:page], :order => "id DESC")
    end
    @giangviens = Giangvien.all
    @lops= Lop.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @covanhoctaps }
        format.xml
        format.js
      end
  end
end
