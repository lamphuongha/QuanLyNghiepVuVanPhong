class GiangviensController < ApplicationController
 load_and_authorize_resource 
  # GET /giangviens
  # GET /giangviens.json
 # layout "main"
  def index
    #@giangviens = Giangvien.all
    if params[:search]
        @countcvs=Giangvien.joins(:chucvu,:hocvi,:ngach).search(params[:search])
        @giangviens=Giangvien.joins(:chucvu,:hocvi,:ngach).search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @countcvs=Giangvien.all
        @giangviens=Giangvien.paginate(:page => params[:page], :order => "id DESC")
        
    end
    @countds = @countcvs.size
    @chucvus = Chucvu.find :all
    @ngaches = Ngach.find :all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @giangviens.map(&:attributes) }
      format.xml
      format.js
    end
  end

  # GET /giangviens/1
  # GET /giangviens/1.json
  def show
    @giangvien = Giangvien.find(params[:id])
      respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @giangvien }
      format.xml
    end
  end

  # GET /giangviens/new
  # GET /giangviens/new.json
  def new
    @giangvien = Giangvien.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @giangvien }
      format.xml
    end
  end

  # GET /giangviens/1/edit
  def edit
    @giangvien = Giangvien.find(params[:id])
  end

  # POST /giangviens
  # POST /giangviens.json
  def create
    @giangvien = Giangvien.new(params[:giangvien])
    @giangvien.hocvis = Hocvi.find(params[:hocvi_id]) if params[:hocvi_id]
    @giangvien.chucvus = Chucvu.find(params[:chucvu_id]) if params[:chucvu_id]
    @giangvien.ngaches = Ngach.find(params[:ngach_id]) if params[:ngach_id]
    respond_to do |format|
      if @giangvien.save
        format.html { redirect_to @giangvien, :notice => 'Thêm giảng viên thành công.' }
        
        format.json { render :json => @giangvien, :status => :created, :location => @giangvien }
        
      else
        format.html { render :action => "new" }
        format.json { render :json => @giangvien.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /giangviens/1
  # PUT /giangviens/1.json
  def update
    @giangvien = Giangvien.find(params[:id])

    respond_to do |format|
      if @giangvien.update_attributes(params[:giangvien])
        format.html { redirect_to @giangvien, :notice => 'Cập nhật giảng viên thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @giangvien.errors, :status => :unprocessable_entity }
      end
    end
  end
 # DELETE /giangviens/1
  # DELETE /giangviens/1.json
  def destroy
    @giangvien = Giangvien.find(params[:id])
    @giangvien.destroy
    
    respond_to do |format|
      format.html { redirect_to giangviens_url }
      format.json { head :no_content }
    end
  end
  def search
    if params[:search]
        @countcvs=Giangvien.all
        @giangviens=Giangvien.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
    else
        @giangviens=Giangvien.search_with_permission(params[:MaGV],params[:HoTenGV],params[:DiaChiGV],params[:SDTGV],params[:chucvu_id],params[:hocvi_id],params[:ngach_id],params[:Hocham]).paginate(:page => params[:page], :order => "id DESC")
        @countcvs=Giangvien.search_with_permission(params[:MaGV],params[:HoTenGV],params[:DiaChiGV],params[:SDTGV],params[:chucvu_id],params[:hocvi_id],params[:ngach_id],params[:Hocham])
    end
    @countds = @countcvs.size
    @chucvus = Chucvu.find :all
    @ngaches = Ngach.find :all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @giangviens }
      format.xml
      format.js
    end
  end
end
