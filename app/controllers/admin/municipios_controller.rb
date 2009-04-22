class Admin::MunicipiosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /municipios
  # GET /municipios.xml
  def index
    @municipios = Municipio.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @municipios }
    end
  end

  # GET /municipios/1
  # GET /municipios/1.xml
  def show
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @municipio }
    end
  end

  # GET /municipios/new
  # GET /municipios/new.xml
  def new
    @municipio = Municipio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @municipio }
    end
  end

  # GET /municipios/1/edit
  def edit
    @municipio = Municipio.find(params[:id])
  end

  # POST /municipios
  # POST /municipios.xml
  def create
    @municipio = Municipio.new(params[:municipio])

    respond_to do |format|
      if @municipio.save
        flash[:notice] = 'Municipio se ha creado con exito.'
        format.html { redirect_to(admin_municipios_url) }
        format.xml  { render :xml => @municipio, :status => :created, :location => @municipio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @municipio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /municipios/1
  # PUT /municipios/1.xml
  def update
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      if @municipio.update_attributes(params[:municipio])
        flash[:notice] = 'Municipio se ha actualizado con exito.'
        format.html { redirect_to(admin_municipios_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @municipio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1
  # DELETE /municipios/1.xml
  def destroy
    @municipio = Municipio.find(params[:id])
    @municipio.destroy

    respond_to do |format|
      format.html { redirect_to(admin_municipios_url) }
      format.xml  { head :ok }
    end
  end
end
