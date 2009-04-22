class Admin::PeriodistasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /periodistas
  # GET /periodistas.xml
  def index
    @periodistas = Periodista.listado(params[:page],params[:buscar], params[:departamento],params[:tipo_medio_id] , params[:institucion_periodistica_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @periodistas }
      format.print{ @periodistas = Periodista.find(:all, :order => "idDepartamento, nombre"); render :layout => 'imprimir' }
    end
  end

  # GET /periodistas/1
  # GET /periodistas/1.xml
  def show
    @periodista = Periodista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @periodista }
    end
  end

  # GET /periodistas/new
  # GET /periodistas/new.xml
  def new
    @periodista = Periodista.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @periodista }
    end
  end

  # GET /periodistas/1/edit
  def edit
    @periodista = Periodista.find(params[:id])
  end

  # POST /periodistas
  # POST /periodistas.xml
  def create
    @periodista = Periodista.new(params[:periodista])

    respond_to do |format|
      if @periodista.save
        flash[:notice] = 'Periodista se ha creado con exito.'
        format.html { redirect_to(admin_periodistas_url) }
        format.xml  { render :xml => @periodista, :status => :created, :location => @periodista }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @periodista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periodistas/1
  # PUT /periodistas/1.xml
  def update
    @periodista = Periodista.find(params[:id])

    respond_to do |format|
      if @periodista.update_attributes(params[:periodista])
        flash[:notice] = 'Periodista se ha actualizado con exito.'
        format.html { redirect_to(admin_periodistas_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @periodista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /periodistas/1
  # DELETE /periodistas/1.xml
  def destroy
    @periodista = Periodista.find(params[:id])
    @periodista.destroy

    respond_to do |format|
      format.html { redirect_to(admin_periodistas_url) }
      format.xml  { head :ok }
    end
  end
end
