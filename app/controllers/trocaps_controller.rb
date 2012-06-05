class TrocapsController < ApplicationController
    load_and_authorize_resource 
  #layout 'main'
  # GET /trocaps
  # GET /trocaps.json
  def index
    if params[:search]
        @trocaps=Trocap.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @trocaps = Trocap.paginate(:page => params[:page], :order => "id DESC")
      end
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @trocaps }
    end
  end

  # GET /trocaps/1
  # GET /trocaps/1.json
  def show
    @trocap = Trocap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @trocap }
    end
  end

  # GET /trocaps/new
  # GET /trocaps/new.json
  def new
    @trocap = Trocap.new
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @trocap.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @trocap }
      format.js
    end
  end

  # GET /trocaps/1/edit
  def edit
    @trocap = Trocap.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @trocap.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @trocap }
      format.js
    end    
  end

  # POST /trocaps
  # POST /trocaps.json
  def create
    @trocap = Trocap.new(params[:trocap])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @trocap.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @trocap.save
        format.html { redirect_to @trocap, :notice => 'Thêm danh sách thành công.' }
        format.json { render :json => @trocap, :status => :created, :location => @trocap }
      else
        format.html { render :action => "new" }
        format.json { render :json => @trocap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trocaps/1
  # PUT /trocaps/1.json
  def update
    @trocap = Trocap.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @trocap.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @trocap.update_attributes(params[:trocap])
        format.html { redirect_to @trocap, :notice => 'Cập nhật thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @trocap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trocaps/1
  # DELETE /trocaps/1.json
  def destroy
    @trocap = Trocap.find(params[:id])
    @trocap.destroy

    respond_to do |format|
      format.html { redirect_to trocaps_url }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:search]
        @trocaps=Trocap.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @trocaps=Trocap.search_with_permission(params[:MaTroCap],params[:TenTroCap],params[:loaitrocap_id],params[:congvan_id],params[:HocKy],params[:NamHoc]).paginate(:page => params[:page], :order => "id DESC")
      end
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @trocaps }
      format.js
    end
  end
    def export_trocaps
    @trocap = Trocap.find(params[:id])
    respond_to do |format|
      format.html { render :layout=>'export_lists' }
      format.xml  { render :xml => @trocap }
    end
  end
end
