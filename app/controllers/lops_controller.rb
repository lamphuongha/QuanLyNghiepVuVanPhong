class LopsController < ApplicationController
  load_and_authorize_resource 
  # GET /lops
  # GET /lops.json
  def index
    if params[:search]
        @lops=Lop.search(params[:search]).paginate(:page => params[:page], :order => "id DESC")
      else
        @lops = Lop.paginate(:page => params[:page], :order => "id DESC")
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lops }
      format.js
    end
  end

  # GET /lops/1
  # GET /lops/1.json
  def show
    @lop = Lop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @lop }
    end
  end

  # GET /lops/new
  # GET /lops/new.json
  def new
    @lop = Lop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @lop }
    end
  end

  # GET /lops/1/edit
  def edit
    @lop = Lop.find(params[:id])
  end

  # POST /lops
  # POST /lops.json
  def create
    @lop = Lop.new(params[:lop])

    respond_to do |format|
      if @lop.save
        format.html { redirect_to @lop, :notice => 'Thêm lớp thành công.' }
        format.json { render :json => @lop, :status => :created, :location => @lop }
      else
        format.html { render :action => "new" }
        format.json { render :json => @lop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lops/1
  # PUT /lops/1.json
  def update
    @lop = Lop.find(params[:id])

    respond_to do |format|
      if @lop.update_attributes(params[:lop])
        format.html { redirect_to @lop, :notice => 'Cập nhật thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @lop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lops/1
  # DELETE /lops/1.json
  def destroy
    @lop = Lop.find(params[:id])
    @lop.destroy

    respond_to do |format|
      format.html { redirect_to lops_url }
      format.json { head :no_content }
    end
  end
end
