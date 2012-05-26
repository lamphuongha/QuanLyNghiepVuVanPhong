class SvsearchController < ApplicationController
  def index
   
      if params[:search]
        @sinhviens=Sinhvien.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @sinhviens=Sinhvien.search_with_permission(params[:MSSV],params[:HoTenSV],params[:DiaChi],params[:SDT],params[:lop_id],params[:NgaySinh]).paginate(:page => params[:page], :order => "id DESC")
        
      end
      
      @chitiethocbong = Chitiethocbong.find :all
      @chitiethocbong.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
      @lops = Lop.find :all
  end
  def save
    @chitiethocbong = Chitiethocbong.new(params[:congvan])
    @sinhviens=Sinhvien.find :all
    @chitiethocbong.sinhviens = Sinhvien.find(params[:sinhvien_ids]) if params[:sinhvien_ids]
    #respond_to do |format|
      
     # if @chitiethocbong.save
     #   format.html { redirect_to @chitiethocbong, :notice => 'Thêm công văn thành công.' }
     #   
     #   format.json { render :json => @chitiethocbong, :status => :created, :location => @chitiethocbong }
      
    #  else
    #    format.html { render :action => "index" }
     #   format.json { render :json => @chitiethocbong.errors, :status => :unprocessable_entity }
    #  end
    #end
  end
end

