class Admin::TipoInstitucionsController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /tipo_institucions
  # GET /tipo_institucions.xml
  def index
    @tipo_institucions = TipoInstitucion.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_institucions }
    end
  end

  # GET /tipo_institucions/1
  # GET /tipo_institucions/1.xml
  def show
    @tipo_institucion = TipoInstitucion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_institucion }
    end
  end

  # GET /tipo_institucions/new
  # GET /tipo_institucions/new.xml
  def new
    @tipo_institucion = TipoInstitucion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_institucion }
    end
  end

  # GET /tipo_institucions/1/edit
  def edit
    @tipo_institucion = TipoInstitucion.find(params[:id])
  end

  # POST /tipo_institucions
  # POST /tipo_institucions.xml
  def create
    @tipo_institucion = TipoInstitucion.new(params[:tipo_institucion])

    respond_to do |format|
      if @tipo_institucion.save
        flash[:notice] = 'TipoInstitucion se creo exitosamente..'
        format.html { redirect_to(admin_tipo_institucions_url) }
        format.xml  { render :xml => @tipo_institucion, :status => :created, :location => @tipo_institucion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_institucion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_institucions/1
  # PUT /tipo_institucions/1.xml
  def update
    @tipo_institucion = TipoInstitucion.find(params[:id])

    respond_to do |format|
      if @tipo_institucion.update_attributes(params[:tipo_institucion])
        flash[:notice] = 'TipoInstitucion se ha actualizado con exito..'
        format.html { redirect_to(admin_tipo_institucions_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_institucion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_institucions/1
  # DELETE /tipo_institucions/1.xml
  def destroy
    @tipo_institucion = TipoInstitucion.find(params[:id])
    @tipo_institucion.destroy

    respond_to do |format|
      format.html { redirect_to(admin_tipo_institucions_url) }
      format.xml  { head :ok }
    end
  end
end
