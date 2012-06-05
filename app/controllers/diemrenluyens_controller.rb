class DiemrenluyensController < ApplicationController
  load_and_authorize_resource 
  # GET /diemrenluyens
  # GET /diemrenluyens.json
  #layout "main"
    #load_and_authorize_resource 
  def index
   if params[:search]
        @diemrenluyens=Diemrenluyen.joins(:congvan).search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @diemrenluyens = Diemrenluyen.paginate(:page => params[:page], :order => "id DESC")
        
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @buocthoihocs }
      format.js
    end
  end

  # GET /diemrenluyens/1
  # GET /diemrenluyens/1.json
  def show
    @diemrenluyen = Diemrenluyen.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @diemrenluyen }
    end
  end

  # GET /diemrenluyens/new
  # GET /diemrenluyens/new.json
  def new
    @diemrenluyen = Diemrenluyen.new
    #@sinhviens=Sinhvien.paginate(:page => params[:page], :order => "id DESC")
    if params[:lop_id]||params[:trinhdodaotao_id]
      @sinhviens=Sinhvien.search_with_permission_drl(params[:lop_id],params[:trinhdodaotao_id])
    else
      @sinhviens=Sinhvien.paginate(:page => params[:page], :order => "id DESC")
    end
    #@sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    #@diemrenluyen.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]    
    #@diemrenluyen.chitietdiemrenluyens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    #1.times { @diemrenluyen.chitietdiemrenluyens.build }
    chitietdiemrenluyen = @diemrenluyen.chitietdiemrenluyens.build()

    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @diemrenluyen }
      format.js
    end
  end

  # GET /diemrenluyens/1/edit
  def edit
    @diemrenluyen = Diemrenluyen.find(params[:id])
    #@sinhviens=Sinhvien.paginate(:page => params[:page], :order => "id DESC")
    #@sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @sinhvien=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh])
    #@diemrenluyen.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    
    #@chitietdiemrenluyen = Chitietdiemrenluyen.find :all
    #@sinhvien=Sinhvien.all
  end

  # POST /diemrenluyens
  # POST /diemrenluyens.json
  def create
    @diemrenluyen = Diemrenluyen.new(params[:diemrenluyen])
    @sinhviens=Sinhvien.paginate(:page => params[:page], :order => "id DESC")
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    #@diemrenluyen.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    #@diemrenluyen.chitietdiemrenluyens = Chitietdiemrenluyen.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @diemrenluyen.save
        format.html { redirect_to @diemrenluyen, :notice => 'Thêm danh sách thành công.' }
        format.json { render :json => @diemrenluyen, :status => :created, :location => @diemrenluyen }
      else
        format.html { render :action => "new" }
        format.json { render :json => @diemrenluyen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diemrenluyens/1
  # PUT /diemrenluyens/1.json
  def update
    @diemrenluyen = Diemrenluyen.find(params[:id])
    @sinhviens=Sinhvien.paginate(:page => params[:page], :order => "id DESC")
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @diemrenluyen.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @diemrenluyen.update_attributes(params[:diemrenluyen])
        format.html { redirect_to @diemrenluyen, :notice => 'Cập nhật thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @diemrenluyen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diemrenluyens/1
  # DELETE /diemrenluyens/1.json
  def destroy
    @diemrenluyen = Diemrenluyen.find(params[:id])
    @diemrenluyen.destroy

    respond_to do |format|
      format.html { redirect_to diemrenluyens_url }
      format.json { head :no_content }
    end
  end
  def search
    if params[:search]
        @diemrenluyens=Diemrenluyen.joins(:congvan).search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @diemrenluyens = Diemrenluyen.search_with_permission(params[:MaDRL],params[:TenDRL],params[:congvan_id],params[:HocKy],params[:NamHoc]).paginate(:page => params[:page], :order => "id DESC")
        
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @buocthoihocs }
      format.js
    end
  end
  
    def export_diemrenluyens
    @diemrenluyen = Diemrenluyen.find(params[:id])
    respond_to do |format|
      format.html { render :layout=>'export_lists' }
      format.xml  { render :xml => @diemrenluyen }
    end
  end
end
