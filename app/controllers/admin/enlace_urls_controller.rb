class Admin::EnlaceUrlsController < ApplicationController
  layout 'admin'
  require_role "administrador"
  
  # GET /enlace_urls
  # GET /enlace_urls.xml
  def index
    @enlace_urls = EnlaceUrl.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @enlace_urls }
    end
  end

  # GET /enlace_urls/1
  # GET /enlace_urls/1.xml
  def show
    @enlace_url = EnlaceUrl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @enlace_url }
    end
  end

  # GET /enlace_urls/new
  # GET /enlace_urls/new.xml
  def new
    @enlace_url = EnlaceUrl.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @enlace_url }
    end
  end

  # GET /enlace_urls/1/edit
  def edit
    @enlace_url = EnlaceUrl.find(params[:id])
  end

  # POST /enlace_urls
  # POST /enlace_urls.xml
  def create
    @enlace_url = EnlaceUrl.new(params[:enlace_url])

    respond_to do |format|
      if @enlace_url.save
        flash[:notice] = 'Enlace Url se creo exitosamente..'
        format.html { redirect_to(admin_enlace_urls_url) }
        format.xml  { render :xml => @enlace_url, :status => :created, :location => @enlace_url }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @enlace_url.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /enlace_urls/1
  # PUT /enlace_urls/1.xml
  def update
    @enlace_url = EnlaceUrl.find(params[:id])

    respond_to do |format|
      if @enlace_url.update_attributes(params[:enlace_url])
        flash[:notice] = 'Enlace Url se ha actualizado con exito..'
        format.html { redirect_to(admin_enlace_urls_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @enlace_url.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enlace_urls/1
  # DELETE /enlace_urls/1.xml
  def destroy
    @enlace_url = EnlaceUrl.find(params[:id])
    @enlace_url.destroy

    respond_to do |format|
      format.html { redirect_to(admin_enlace_urls_url) }
      format.xml  { head :ok }
    end
  end
end
