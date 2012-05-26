class ChucvusController < ApplicationController
  layout 'main'
    load_and_authorize_resource 
    # GET /chucvus
  # GET /chucvus.json
  def index
    @chucvus = Chucvu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @chucvus }
      format.xml
    end
  end

  # GET /chucvus/1
  # GET /chucvus/1.json
  def show
    @chucvu = Chucvu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @chucvu }
      format.xml
    end
  end

  # GET /chucvus/new
  # GET /chucvus/new.json
  def new
    @chucvu = Chucvu.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @chucvu }
      format.xml
    end
  end

  # GET /chucvus/1/edit
  def edit
    @chucvu = Chucvu.find(params[:id])
  end

  # POST /chucvus
  # POST /chucvus.json
  def create
    @chucvu = Chucvu.new(params[:chucvu])
    respond_to do |format|
      if @chucvu.save
        format.html { redirect_to @chucvu, :notice => 'Thêm chức vụ thành công.' }
        
        format.json { render :json => @chucvu, :status => :created, :location => @chucvu }
        
      else
        format.html { render :action => "new" }
        format.json { render :json => @chucvu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chucvus/1
  # PUT /chucvus/1.json
  def update
    @chucvu = Chucvu.find(params[:id])

    respond_to do |format|
      if @chucvu.update_attributes(params[:chucvu])
        format.html { redirect_to @chucvu, :notice => 'Cập nhật chức vụ thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @chucvu.errors, :status => :unprocessable_entity }
      end
    end
  end
 # DELETE /chucvus/1
  # DELETE /chucvus/1.json
  def destroy
    @chucvu = Chucvu.find(params[:id])
    @chucvu.destroy

    respond_to do |format|
      format.html { redirect_to chucvus_url }
      format.json { head :no_content }
    end
  end
 
end
