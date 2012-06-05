class BaoluusController < ApplicationController
  load_and_authorize_resource 
  #layout 'main'
  # GET /baoluus
  # GET /baoluus.json
  def index
    if params[:search]
      @dembaoluus = Baoluu.joins(:congvan).search(params[:search])
      @baoluus=Baoluu.joins(:congvan).search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @dembaoluus = Baoluu.all
        @baoluus = Baoluu.paginate(:page => params[:page], :order => "id DESC")
      end
      @dem = @dembaoluus.size
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @baoluus }
      format.js
    end
  end

  # GET /baoluus/1
  # GET /baoluus/1.json
  def show
    @baoluu = Baoluu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @baoluu }
    end
  end

  # GET /baoluus/new
  # GET /baoluus/new.json
  def new
    @baoluu = Baoluu.new
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @baoluu.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @baoluu }
      format.js
    end
  end

  # GET /baoluus/1/edit
  def edit
    @baoluu = Baoluu.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @baoluu.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @baoluu }
      format.js
    end
  end

  # POST /baoluus
  # POST /baoluus.json
  def create
    @baoluu = Baoluu.new(params[:baoluu])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @baoluu.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @baoluu.save
        format.html { redirect_to @baoluu, :notice => 'Tạo danh sách thành công.' }
        format.json { render :json => @baoluu, :status => :created, :location => @baoluu }
      else
        format.html { render :action => "new" }
        format.json { render :json => @baoluu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /baoluus/1
  # PUT /baoluus/1.json
  def update
    @baoluu = Baoluu.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @baoluu.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @baoluu.update_attributes(params[:baoluu])
        format.html { redirect_to @baoluu, :notice => 'Cập nhật danh sách thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @baoluu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /baoluus/1
  # DELETE /baoluus/1.json
  def destroy
    @baoluu = Baoluu.find(params[:id])
    @baoluu.destroy

    respond_to do |format|
      format.html { redirect_to baoluus_url }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:search]
        @baoluus=Baoluu.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
        @dembaoluus=Baoluu.search(params[:search])
      else
        @baoluus = Baoluu.search_with_permission(params[:MaBaoLuu],params[:TenBaoLuu],params[:congvan_id],params[:HocKy],params[:NamHoc]).paginate(:page => params[:page], :order => "id DESC")
        @dembaoluus = Baoluu.search_with_permission(params[:MaBaoLuu],params[:TenBaoLuu],params[:congvan_id],params[:HocKy],params[:NamHoc])
      end
    
    @dem = @dembaoluus.size

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @baoluus }
      format.js
    end
  end
    def export_baoluus
    @baoluu = Baoluu.find(params[:id])
    respond_to do |format|
      format.html { render :layout=>'export_lists' }
      format.xml  { render :xml => @baoluu }
    end
  end
end
