class NoitrusController < ApplicationController
  #layout 'main'
    load_and_authorize_resource 
  # GET /noitrus
  # GET /noitrus.json
  def index
    if params[:search]
        @noitrus=Noitru.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @noitrus = Noitru.paginate(:page => params[:page], :order => "id DESC")
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @noitrus }
    end
  end

  # GET /noitrus/1
  # GET /noitrus/1.json
  def show
    @noitru = Noitru.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @noitru }
    end
  end

  # GET /noitrus/new
  # GET /noitrus/new.json
  def new
    @noitru = Noitru.new
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @noitru.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @noitru }
      format.js
    end
  end

  # GET /noitrus/1/edit
  def edit
    @noitru = Noitru.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @noitru.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @noitru }
      format.js
    end
  end

  # POST /noitrus
  # POST /noitrus.json
  def create
    @noitru = Noitru.new(params[:noitru])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @noitru.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @noitru.save
        format.html { redirect_to @noitru, :notice => 'Noitru was successfully created.' }
        format.json { render :json => @noitru, :status => :created, :location => @noitru }
      else
        format.html { render :action => "new" }
        format.json { render :json => @noitru.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /noitrus/1
  # PUT /noitrus/1.json
  def update
    @noitru = Noitru.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @noitru.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @noitru.update_attributes(params[:noitru])
        format.html { redirect_to @noitru, :notice => 'Noitru was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @noitru.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /noitrus/1
  # DELETE /noitrus/1.json
  def destroy
    @noitru = Noitru.find(params[:id])
    @noitru.destroy

    respond_to do |format|
      format.html { redirect_to noitrus_url }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:search]
        @noitrus=Noitru.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @noitrus = Noitru.search_with_permission(params[:MaNoiTru],params[:TenNoiTru],params[:congvan_id],params[:HocKy],params[:NamHoc]).paginate(:page => params[:page], :order => "id DESC")
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @noitrus }
    end
  end
  
end
