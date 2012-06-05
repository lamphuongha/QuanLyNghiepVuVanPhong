class CongvansController < ApplicationController
    load_and_authorize_resource 
  # GET /congvans
  # GET /congvans.json
  def index
    #@congvans = Congvan.all
      #@congvans = Congvan.where("SoCV LIKE ?", "%#{params[:loc]}")
      #@congvans=Congvan.search(params[:search])
      #@congvans = Congvan.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
      
      if params[:search]
        @countcvs=Congvan.search(params[:search])
        @congvans=Congvan.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @countcvs = Congvan.all
        @congvans = Congvan.paginate(:page => params[:page], :order => "id DESC")
      end
      #@congvans = Congvan.all.paginate(:page => params[:page], :order => "id DESC")
      @countds = @countcvs.size
      @nhomcvs = Nhomcv.find :all
      @nhomloaicvs = Nhomloaicv.find :all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @congvans }
        format.xml
        format.js
      end
  end

  # GET /congvans/1
  # GET /congvans/1.json
  def show
    @congvan = Congvan.find(params[:id])
    @nhomcvs = Nhomcv.find :all
    @nhomloaicvs = Nhomloaicv.find :all
    @loaicv = Loaicv.find :all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @congvan }
      format.xml
    end
  end

  # GET /congvans/new
  # GET /congvans/new.json
  def new
    @congvan = Congvan.new
    @nhomcvs = Nhomcv.all
    @congvan.nhomcvs = Nhomcv.find(params[:nhomcv_ids]) if params[:nhomcv_ids]
    @giangviens = Giangvien.find :all
    @congvan.giangviens = Giangvien.find(params[:giangvien_ids]) if params[:giangvien_ids]
    5.times { @congvan.assets.build  }
#    @user = User.find_by_giangvien_id(params[:id]) 
#    if @user
#      GiangvienMailer.send_mail(@user).deliver 
#      flash.now.alert = "Gửi email thành công"
#    end
    flash.alert = ""
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @congvan }
      #format.xml
      format.js{}
    end
  end

  # GET /congvans/1/edit
  def edit
    @congvan = Congvan.find(params[:id])
    @nhomcvs = Nhomcv.find :all
    @giangviens = Giangvien.all
    5.times { @congvan.assets.build  }
  end

  # POST /congvans
  # POST /congvans.json
  def create
    @congvan = Congvan.new(params[:congvan])
    @nhomcvs = Nhomcv.all
    @giangviens = Giangvien.all
    @congvan.nhomcvs = Nhomcv.find(params[:nhomcv_ids]) if params[:nhomcv_ids]
    @congvan.giangviens = Giangvien.find(params[:giangvien_ids]) if params[:giangvien_ids]
    respond_to do |format|
      
      if @congvan.save
        #GiangvienMailer.send_mail(@congvan.giangviens).deliver
        format.html { redirect_to @congvan, :notice => 'Thêm công văn thành công.' }
        
        format.json { render :json => @congvan, :status => :created, :location => @congvan }
      
      else
        format.html { render :action => "new" }
        format.json { render :json => @congvan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /congvans/1
  # PUT /congvans/1.json
  def update
    @congvan = Congvan.find(params[:id])
    @nhomcvs = Nhomcv.all
    @giangviens = Giangvien.all
    @congvan.nhomcvs = Nhomcv.find(params[:nhomcv_ids]) if params[:nhomcv_ids]
    @congvan.giangviens = Giangvien.find(params[:giangvien_ids]) if params[:giangvien_ids]
    respond_to do |format|
      if @congvan.update_attributes(params[:congvan])
        format.html { redirect_to @congvan, :notice => 'Cập nhật công văn thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @congvan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /congvans/1
  # DELETE /congvans/1.json
  def destroy
    @congvan = Congvan.find(params[:id])
    @congvan.destroy

    respond_to do |format|
      format.html { redirect_to congvans_url }
      format.json { head :no_content }
    end
  end
  def search
      @nhomcvs = Nhomcv.find :all
      @nhomloaicvs = Nhomloaicv.find :all
      @giangviens = Giangvien.find :all
      if params[:search]
        @congvans=Congvan.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
          @congvans=Congvan.search_with_permission(params[:SoCV],params[:NoiDungCV],params[:loaicv_id],params[:NoiGui],params[:NoiNhan],params[:nhomloaicv_id],params[:TacGia],params[:NguoiNhan],params[:NgayNhanCV],params[:NgayRaCV],params[:startday],params[:endday],params[:nhomcv_ids],params[:giangvien_id]).paginate(:page => params[:page], :order => "id DESC")
          @countcvs=Congvan.search_with_permission(params[:SoCV],params[:NoiDungCV],params[:loaicv_id],params[:NoiGui],params[:NoiNhan],params[:nhomloaicv_id],params[:TacGia],params[:NguoiNhan],params[:NgayNhanCV],params[:NgayRaCV],params[:startday],params[:endday],params[:nhomcv_ids],params[:giangvien_id])
      end
      @countds = @countcvs.size
    #@congvans = Congvan.find_all_by_loaicv_id(params[:id])
    #@congvans=Congvan.find_by_sql("select * from congvans,nhomloaicvs where NhomLoaiCV = " + params[:loai]+ " and congvans.id = congvans_phongbans.congvan_id")
      respond_to do |format|
      format.html # search.html.erb
      format.json { render :json => @congvans }
      format.js
    end
  end
   
 
  def excel_import
       require 'spreadsheet'
      Spreadsheet.client_encoding = 'UTF-8'
      #book = Spreadsheet.open(params[:dump][:excel_file]) 
      book = Spreasheet.open '/Users/LAMPHUONG/Desktop/LuanVan/congvan.xls'
      sheet1 = book.worksheet 0
      sheet1.each do |row|
        # you can do any interesing thing with row
      Congvan.new(:SoCV => row[0], :loaicv_id => row[1]).save
      end
      respond_to do |format|
      format.html # search.html.erb
      format.json { render :json => @congvans }
    end
    end
    def send_mail
      @user = User.find_by_giangvien_id(params[:id])
      if @user
      GiangvienMailer.send_mail(@user).deliver
      flash.alert = "Gửi email thành công!"
      else 
        flash.alert = ""
      end
      respond_to do |format|
          format.js { render :layout=>false, :notice => "Đăng nhập thành công!"}
      end
  
    end
  
end