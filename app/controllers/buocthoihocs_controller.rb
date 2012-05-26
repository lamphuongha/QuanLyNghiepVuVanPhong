class BuocthoihocsController < ApplicationController
  #layout 'main'
  load_and_authorize_resource 
  # GET /buocthoihocs
  # GET /buocthoihocs.json
  def index
    if params[:search]
        @buocthoihocs=Buocthoihoc.joins(:loaibuocthoihoc,:congvan).search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @buocthoihocs = Buocthoihoc.paginate(:page => params[:page], :order => "id DESC")
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @buocthoihocs }
      format.js
    end
  end

  # GET /buocthoihocs/1
  # GET /buocthoihocs/1.json
  def show
    @buocthoihoc = Buocthoihoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @buocthoihoc }
    end
  end

  # GET /buocthoihocs/new
  # GET /buocthoihocs/new.json
  def new
    @buocthoihoc = Buocthoihoc.new
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @buocthoihoc.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @buocthoihoc }
      format.js
    end
  end

  # GET /buocthoihocs/1/edit
  def edit
    @buocthoihoc = Buocthoihoc.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @buocthoihoc.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
  end

  # POST /buocthoihocs
  # POST /buocthoihocs.json
  def create
    @buocthoihoc = Buocthoihoc.new(params[:buocthoihoc])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @buocthoihoc.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @buocthoihoc.save
        format.html { redirect_to @buocthoihoc, :notice => 'Buocthoihoc was successfully created.' }
        format.json { render :json => @buocthoihoc, :status => :created, :location => @buocthoihoc }
      else
        format.html { render :action => "new" }
        format.json { render :json => @buocthoihoc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /buocthoihocs/1
  # PUT /buocthoihocs/1.json
  def update
    @buocthoihoc = Buocthoihoc.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @buocthoihoc.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @buocthoihoc.update_attributes(params[:buocthoihoc])
        format.html { redirect_to @buocthoihoc, :notice => 'Buocthoihoc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @buocthoihoc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /buocthoihocs/1
  # DELETE /buocthoihocs/1.json
  def destroy
    @buocthoihoc = Buocthoihoc.find(params[:id])
    @buocthoihoc.destroy

    respond_to do |format|
      format.html { redirect_to buocthoihocs_url }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:search]
        @buocthoihocs=Buocthoihoc.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @buocthoihocs = Buocthoihoc.search_with_permission(params[:MaBTH],params[:TenBTH],params[:loaibuocthoihoc_id],params[:congvan_id],params[:HocKy],params[:NamHoc]).paginate(:page => params[:page], :order => "id DESC")
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @buocthoihocs }
      format.js
    end
  end
  
  
end
