class ThongtinthuctapsController < ApplicationController
  # GET /thongtinthuctaps
  # GET /thongtinthuctaps.json
  def index
    @thongtinthuctaps = Thongtinthuctap.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @thongtinthuctaps }
    end
  end

  # GET /thongtinthuctaps/1
  # GET /thongtinthuctaps/1.json
  def show
    @thongtinthuctap = Thongtinthuctap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @thongtinthuctap }
    end
  end

  # GET /thongtinthuctaps/new
  # GET /thongtinthuctaps/new.json
  def new
    @thongtinthuctap = Thongtinthuctap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @thongtinthuctap }
    end
  end

  # GET /thongtinthuctaps/1/edit
  def edit
    @thongtinthuctap = Thongtinthuctap.find(params[:id])
  end

  # POST /thongtinthuctaps
  # POST /thongtinthuctaps.json
  def create
    @thongtinthuctap = Thongtinthuctap.new(params[:thongtinthuctap])

    respond_to do |format|
      if @thongtinthuctap.save
        format.html { redirect_to @thongtinthuctap, :notice => 'Thongtinthuctap was successfully created.' }
        format.json { render :json => @thongtinthuctap, :status => :created, :location => @thongtinthuctap }
      else
        format.html { render :action => "new" }
        format.json { render :json => @thongtinthuctap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thongtinthuctaps/1
  # PUT /thongtinthuctaps/1.json
  def update
    @thongtinthuctap = Thongtinthuctap.find(params[:id])

    respond_to do |format|
      if @thongtinthuctap.update_attributes(params[:thongtinthuctap])
        format.html { redirect_to @thongtinthuctap, :notice => 'Thongtinthuctap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @thongtinthuctap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thongtinthuctaps/1
  # DELETE /thongtinthuctaps/1.json
  def destroy
    @thongtinthuctap = Thongtinthuctap.find(params[:id])
    @thongtinthuctap.destroy

    respond_to do |format|
      format.html { redirect_to thongtinthuctaps_url }
      format.json { head :no_content }
    end
  end
end
