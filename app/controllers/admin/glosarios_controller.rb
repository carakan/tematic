class Admin::GlosariosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /glosarios
  # GET /glosarios.xml
  def index
    @glosarios = Glosario.busqueda(params[:page],params[:generico], params[:buscar], 20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @glosarios }
    end
  end

  # GET /glosarios/1
  # GET /glosarios/1.xml
  def show
    @glosario = Glosario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @glosario }
    end
  end

  # GET /glosarios/new
  # GET /glosarios/new.xml
  def new
    @glosario = Glosario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @glosario }
    end
  end

  # GET /glosarios/1/edit
  def edit
    @glosario = Glosario.find(params[:id])
  end

  # POST /glosarios
  # POST /glosarios.xml
  def create
    @glosario = Glosario.new(params[:glosario])

    respond_to do |format|
      if @glosario.save
        flash[:notice] = 'Glosario se ha creado con exito.'
        format.html { redirect_to(admin_glosarios_path) }
        format.xml  { render :xml => @glosario, :status => :created, :location => @glosario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @glosario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /glosarios/1
  # PUT /glosarios/1.xml
  def update
    @glosario = Glosario.find(params[:id])

    respond_to do |format|
      if @glosario.update_attributes(params[:glosario])
        flash[:notice] = 'Glosario se ha actualizado con exito.'
        format.html { redirect_to(admin_glosarios_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @glosario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /glosarios/1
  # DELETE /glosarios/1.xml
  def destroy
    @glosario = Glosario.find(params[:id])
    @glosario.destroy

    respond_to do |format|
      format.html { redirect_to(admin_glosarios_path) }
      format.xml  { head :ok }
    end
  end
end
