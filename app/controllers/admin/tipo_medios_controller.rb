class Admin::TipoMediosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /tipo_medios
  # GET /tipo_medios.xml
  def index
    @tipo_medios = TipoMedio.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_medios }
    end
  end

  # GET /tipo_medios/1
  # GET /tipo_medios/1.xml
  def show
    @tipo_medio = TipoMedio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_medio }
    end
  end

  # GET /tipo_medios/new
  # GET /tipo_medios/new.xml
  def new
    @tipo_medio = TipoMedio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_medio }
    end
  end

  # GET /tipo_medios/1/edit
  def edit
    @tipo_medio = TipoMedio.find(params[:id])
  end

  # POST /tipo_medios
  # POST /tipo_medios.xml
  def create
    @tipo_medio = TipoMedio.new(params[:tipo_medio])

    respond_to do |format|
      if @tipo_medio.save
        flash[:notice] = 'TipoMedio se ha creado con exito.'
        format.html { redirect_to(admin_tipo_medios_url) }
        format.xml  { render :xml => @tipo_medio, :status => :created, :location => @tipo_medio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_medio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_medios/1
  # PUT /tipo_medios/1.xml
  def update
    @tipo_medio = TipoMedio.find(params[:id])

    respond_to do |format|
      if @tipo_medio.update_attributes(params[:tipo_medio])
        flash[:notice] = 'TipoMedio se ha actualizado con exito.'
        format.html { redirect_to(admin_tipo_medios_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_medio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_medios/1
  # DELETE /tipo_medios/1.xml
  def destroy
    @tipo_medio = TipoMedio.find(params[:id])
    @tipo_medio.destroy

    respond_to do |format|
      format.html { redirect_to(admin_tipo_medios_url) }
      format.xml  { head :ok }
    end
  end
end
