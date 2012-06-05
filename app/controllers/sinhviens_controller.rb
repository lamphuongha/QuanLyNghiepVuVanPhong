class SinhviensController < ApplicationController
  load_and_authorize_resource 
  #layout 'main'
  # GET /sinhviens
  # GET /sinhviens.json
  def index
    #@sinhviens = Sinhvien.all
    if params[:search]
      @countcvs=Sinhvien.joins(:lop) .search(params[:search])
      @sinhviens=Sinhvien.joins(:lop) .search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @countcvs = Sinhvien.all
        @sinhviens = Sinhvien.paginate(:page => params[:page], :order => "id DESC")
      end
    @countds = @countcvs.size
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sinhviens }
      format.xml
      format.js
    end
  end

  # GET /sinhviens/1
  # GET /sinhviens/1.json
  def show
   @sinhvien = Sinhvien.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sinhvien }
      format.xml
    end
  end

  # GET /sinhviens/new
  # GET /sinhviens/new.json
  def new
    @sinhvien = Sinhvien.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sinhvien }
      format.xml
    end
  end

  # GET /sinhviens/1/edit
  def edit
    @sinhvien = Sinhvien.find(params[:id])
  end

  # POST /sinhviens
  # POST /sinhviens.json
  def create
    @sinhvien = Sinhvien.new(params[:sinhvien])
    @sinhvien.lops = Lop.find(params[:lop_id]) if params[:lop_id]

    respond_to do |format|
      if @sinhvien.save
        format.html { redirect_to @sinhvien, :notice => 'Thêm sinh viên thành công.' }
        
        format.json { render :json => @sinhvien, :status => :created, :location => @sinhvien }
        
      else
        format.html { render :action => "new" }
        format.json { render :json => @sinhvien.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sinhviens/1
  # PUT /sinhviens/1.json
  def update
    @sinhvien = Sinhvien.find(params[:id])

    respond_to do |format|
      if @sinhvien.update_attributes(params[:sinhvien])
        format.html { redirect_to @sinhvien, :notice => 'Cập nhật sinh viên thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sinhvien.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sinhviens/1
  # DELETE sinhviens/1.json
  def destroy
    @sinhvien = Sinhvien.find(params[:id])
    @sinhvien.destroy

    respond_to do |format|
      format.html { redirect_to sinhviens_url }
      format.json { head :no_content }
    end
  end
  def search
    if params[:search]
        @countcvs=Sinhvien.search(params[:search])
        @sinhviens=Sinhvien.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @countcvs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh])
        @sinhviens=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
      end
      @countds = @countcvs.size
      respond_to do |format|
      format.html # search.html.erb
      format.json { render :json => @sinhviens }
      format.js
    end
  end
  def thongtinthuctap
      if params[:search]
      @sinhviens=Sinhvien.joins(:lop).search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @sinhviens = Sinhvien.paginate(:page => params[:page], :order => "id DESC")
      end
      
      respond_to do |format|
      format.html # search.html.erb
      format.json { render :json => @sinhviens }
      format.js
    end
  end
  def updatett
        @sinhviens = Sinhvien.all
        #@sinhviens = Sinhvien.paginate(:page => params[:page], :order => "id DESC")
        #Sinhvien.update_all(["completed_at=?", Time.now],:id => params[:sinhvien_ids])
       #@sinhviens.update_all(["completed_at=?", Time.now],:id => params[:sinhvien_ids])
      @sinhviens.each do |sinhvien|
        sinhvien.update_attributes!(params[:sinhvien])
        #sinhvien.update_all(["completed_at=?", Time.now],:TenCongTy => params[:tencongty])
      end
      #@sinhviens.update(params[:sinhvien])
#      @sinhviens.update_attributes!(params[:sinhvien])
       redirect_to '/trangchu'
  end

end
