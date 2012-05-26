class HocvisController < ApplicationController
    load_and_authorize_resource 
    # GET /hocvis
  # GET /hocvis.json
  def index
    @hocvis = Hocvi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hocvis }
      format.xml
    end
  end

  # GET /hocvis/1
  # GET /hocvis/1.json
  def show
    @hocvi = Hocvi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hocvi }
      format.xml
    end
  end

  # GET /hocvis/new
  # GET /hocvis/new.json
  def new
    @hocvi = Hocvi.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hocvi }
      format.xml
    end
  end

  # GET /hocvis/1/edit
  def edit
    @hocvi = Hocvi.find(params[:id])
  end

  # POST /hocvis
  # POST /hocvis.json
  def create
    @hocvi = Hocvi.new(params[:hocvi])
    respond_to do |format|
      if @hocvi.save
        format.html { redirect_to @hocvi, :notice => 'Thêm chức vụ thành công.' }
        
        format.json { render :json => @hocvi, :status => :created, :location => @hocvi }
        
      else
        format.html { render :action => "new" }
        format.json { render :json => @hocvi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hocvis/1
  # PUT /hocvis/1.json
  def update
    @hocvi = Hocvi.find(params[:id])

    respond_to do |format|
      if @hocvi.update_attributes(params[:hocvi])
        format.html { redirect_to @hocvi, :notice => 'Cập nhật chức vụ thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hocvi.errors, :status => :unprocessable_entity }
      end
    end
  end
 # DELETE /hocvis/1
  # DELETE /hocvis/1.json
  def destroy
    @hocvi = Hocvi.find(params[:id])
    @hocvi.destroy

    respond_to do |format|
      format.html { redirect_to hocvis_url }
      format.json { head :no_content }
    end
  end
 
end
