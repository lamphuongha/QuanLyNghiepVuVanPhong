class StatisticsController < ApplicationController
  def index
    if params[:search]
        @sinhviens=Sinhvien.search(params[:search])
    else
        @sinhviens=Sinhvien.search_for_statistic(params[:MSSV],params[:lop_id],params[:trinhdodaotao_id])
        @svnam=Sinhvien.search_for_statistic_sex(params[:MSSV],params[:lop_id],params[:trinhdodaotao_id],'Nam')
        @svnu=Sinhvien.search_for_statistic_sex(params[:MSSV],params[:lop_id],params[:trinhdodaotao_id],'Nu')
        @congvans=Congvan.search_for_statistic(params[:loaicv_id],params[:NoiGui],params[:NoiNhan],params[:TacGia],params[:NamHoc])
        @lops = Lop.all
        
    end
    respond_to do |format|
      format.html # search.html.erb
      format.json { render :json => @sinhviens }
      format.js
    end
  end
end
