class ExtraSearchController < ApplicationController
    load_and_authorize_resource 
  def index
      @nhomcvs = Nhomcv.find :all
      @nhomloaicvs = Nhomloaicv.find :all
      if params[:search]
        @congvans=Congvan.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
          @congvans=Congvan.search_with_permission(params[:SoCV],params[:loaicv_id],params[:NoiGui],params[:NoiNhan],params[:nhomloaicv_id],params[:NoiDungCV],params[:TacGia],params[:NguoiNhan],params[:NgayNhanCV],params[:NgayRaCV],params[:startday],params[:endday]).paginate(:page => params[:page], :order => "id DESC")
      end
      

      #respond_to do |format|
       # format.html # index.html.erb
       # format.json { render :json => @congvans }
       # format.xml
      #end
  end
end
