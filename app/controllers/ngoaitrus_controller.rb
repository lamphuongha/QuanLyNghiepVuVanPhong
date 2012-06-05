class NgoaitrusController < ApplicationController
  #layout 'main'
    load_and_authorize_resource 
  # GET /ngoaitrus
  # GET /ngoaitrus.json
  def index
    if params[:search]
        @ngoaitrus=Ngoaitru.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @ngoaitrus = Ngoaitru.paginate(:page => params[:page], :order => "id DESC")
      end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ngoaitrus }
    end
  end

  # GET /ngoaitrus/1
  # GET /ngoaitrus/1.json
  def show
    @ngoaitru = Ngoaitru.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ngoaitru }
    end
  end

  # GET /ngoaitrus/new
  # GET /ngoaitrus/new.json
  def new
    @ngoaitru = Ngoaitru.new
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @ngoaitru.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ngoaitru }
      format.js
    end
  end

  # GET /ngoaitrus/1/edit
  def edit
    @ngoaitru = Ngoaitru.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @ngoaitru.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ngoaitru }
      format.js
    end
  end

  # POST /ngoaitrus
  # POST /ngoaitrus.json
  def create
    @ngoaitru = Ngoaitru.new(params[:ngoaitru])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @ngoaitru.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @ngoaitru.save
        format.html { redirect_to @ngoaitru, :notice => 'Thêm danh sách thành công.' }
        format.json { render :json => @ngoaitru, :status => :created, :location => @ngoaitru }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ngoaitru.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ngoaitrus/1
  # PUT /ngoaitrus/1.json
  def update
    @ngoaitru = Ngoaitru.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @ngoaitru.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @ngoaitru.update_attributes(params[:ngoaitru])
        format.html { redirect_to @ngoaitru, :notice => 'Cập nhật thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ngoaitru.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ngoaitrus/1
  # DELETE /ngoaitrus/1.json
  def destroy
    @ngoaitru = Ngoaitru.find(params[:id])
    @ngoaitru.destroy

    respond_to do |format|
      format.html { redirect_to ngoaitrus_url }
      format.json { head :no_content }
    end
  end
  def search
    if params[:search]
        @ngoaitrus=Ngoaitru.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @ngoaitrus = Ngoaitru.search_with_permission(params[:MaNgoaiTru],params[:TenNgoaiTru],params[:loaingoaitru_id],params[:congvan_id],params[:HocKy],params[:NamHoc]).paginate(:page => params[:page], :order => "id DESC")
      end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ngoaitrus }
      format.js
    end
  end
    def export_ngoaitrus
    @ngoaitru = Ngoaitru.find(params[:id])
    respond_to do |format|
      format.html { render :layout=>'export_lists' }
      format.xml  { render :xml => @ngoaitru }
    end
  end
  
end
