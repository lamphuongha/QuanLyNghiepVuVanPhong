class HocbongsController < ApplicationController
  load_and_authorize_resource 
  # GET /hocbongs
  # GET /hocbongs.json
  def index
    #@hocbongs = Hocbong.all
    if params[:search]
      @countcvs=Hocbong.joins(:loaihocbong,:congvan).search(params[:search])
        @hocbongs=Hocbong.joins(:loaihocbong,:congvan).search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @countcvs=Hocbong.all
        @hocbongs = Hocbong.paginate(:page => params[:page], :order => "id DESC")
      end
      @countds = @countcvs.size
    @congvan = Congvan.find :all
    @loaihocbong = Loaihocbong.find :all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hocbongs }
      format.js
    end
  end

  # GET /hocbongs/1
  # GET /hocbongs/1.json
  def show
    @hocbong = Hocbong.find(params[:id])
    #@chitiethocbongs = Chitiethocbong.paginate(:page => params[:page], :order => "id DESC")
    
    respond_to do |format|
      #format.pdf
      format.html # show.html.erb
      format.json { render :json => @hocbong }
      #format.pdf { render :text => PDFKit.new( hocbong_url(@hocbong) ).to_pdf }
      format.pdf
      # format.pdf do
      #render :pdf => :id,
      #  :layout => 'application',
      #  :template => 'hocbongs/#{:id}.html.erb'
      #end

    end
  end

  # GET /hocbongs/new
  # GET /hocbongs/new.json
  def new
    @hocbong = Hocbong.new
    @sinhviens=Sinhvien.all
    @countsinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh])
    @countds = @countsinhviensearchs.size
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @hocbong.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hocbong }
      format.js
    end
  end

  # GET /hocbongs/1/edit
  def edit
    @hocbong = Hocbong.find(params[:id])
    @countsinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh])
    @countds = @countsinhviensearchs.size
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @hocbong.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hocbong }
      format.js
    end
  end

  # POST /hocbongs
  # POST /hocbongs.json
  def create
    @hocbong = Hocbong.new(params[:hocbong])
    #@congvan = Congvan.find :all
    @loaihocbong = Loaihocbong.find :all
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @hocbong.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    
    respond_to do |format|
      if @hocbong.save
        format.html { redirect_to @hocbong, :notice => 'Thêm danh sách thành công.' }
        format.json { render :json => @hocbong, :status => :created, :location => @hocbong }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hocbong.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hocbongs/1
  # PUT /hocbongs/1.json
  def update
    @hocbong = Hocbong.find(params[:id])
    @sinhviens=Sinhvien.all
    @sinhviensearchs=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh],params[:trinhdodaotao_id],params[:GioiTinh]).paginate(:page => params[:page], :order => "id DESC")
    @hocbong.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    respond_to do |format|
      if @hocbong.update_attributes(params[:hocbong])
        format.html { redirect_to @hocbong, :notice => 'Cập nhật thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hocbong.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hocbongs/1
  # DELETE /hocbongs/1.json
  def destroy
    @hocbong = Hocbong.find(params[:id])
    @hocbong.destroy

    respond_to do |format|
      format.html { redirect_to hocbongs_url }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:search]
      @countcvs=Hocbong.search(params[:search])
        @hocbongs=Hocbong.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @countcvs=Hocbong.search_with_permission(params[:MaHocBong],params[:TenHocBong],params[:loaihocbong_id],params[:congvan_id],params[:NoiCap],params[:HocKy],params[:NamHoc],params[:NgayLap])
        @hocbongs = Hocbong.search_with_permission(params[:MaHocBong],params[:TenHocBong],params[:loaihocbong_id],params[:congvan_id],params[:NoiCap],params[:HocKy],params[:NamHoc],params[:NgayLap]).paginate(:page => params[:page], :order => "id DESC")
      end
      @countds = @countcvs.size
    @congvan = Congvan.find :all
    @loaihocbong = Loaihocbong.find :all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hocbongs }
      format.js
    end
  end

  #def pdf
  #respond_to do |format|
  #    format.pdf { render :text => PDFKit.new( Pdf.find(params[:id]).content ).to_pdf }
  #  end
  #end
  def export_hocbongs
    @hocbong = Hocbong.find(params[:id])
    respond_to do |format|
      format.html { render :layout=>'export_lists' }
      format.xml  { render :xml => @hocbong }
    end
  end
end
