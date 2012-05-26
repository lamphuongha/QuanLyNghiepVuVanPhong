class NgachesController < ApplicationController
    load_and_authorize_resource 
   # GET /ngaches
  # GET /ngaches.json
  def index
    @ngach = Ngach.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ngach }
      format.xml
    end
  end

  # GET /ngaches/1
  # GET /ngaches/1.json
  def show
    @ngach = Ngach.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ngach }
      format.xml
    end
  end

  # GET /ngaches/new
  # GET /ngaches/new.json
  def new
    @ngach = Ngach.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ngach }
      format.xml
    end
  end

  # GET /ngaches/1/edit
  def edit
    @ngach = Ngach.find(params[:id])
  end

  # POST /ngaches
  # POST /ngaches.json
  def create
    @ngach = Ngach.new(params[:ngach])
    respond_to do |format|
      if @ngach.save
        format.html { redirect_to @ngach, :notice => 'Thêm ngạch thành công.' }
        
        format.json { render :json => @ngach, :status => :created, :location => @ngach }
        
      else
        format.html { render :action => "new" }
        format.json { render :json => @ngach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ngaches/1
  # PUT /ngaches/1.json
  def update
    @ngach = Ngach.find(params[:id])

    respond_to do |format|
      if @ngach.update_attributes(params[:ngach])
        format.html { redirect_to @ngach, :notice => 'Cập nhật ngạch thành công.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ngach.errors, :status => :unprocessable_entity }
      end
    end
  end
 # DELETE /ngaches/1
  # DELETE /ngaches/1.json
  def destroy
    @ngach = Ngach.find(params[:id])
    @ngach.destroy

    respond_to do |format|
      format.html { redirect_to ngaches_url }
      format.json { head :no_content }
    end
  end
end
