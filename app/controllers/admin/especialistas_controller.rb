class Admin::EspecialistasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /especialistas
  # GET /especialistas.xml
  def index
    @especialistas = Especialista.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especialistas }
      format.print{ @especialistas = Especialista.find(:all); render :layout => 'imprimir' }
    end
  end

  # GET /especialistas/1
  # GET /especialistas/1.xml
  def show
    @especialista = Especialista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @especialista }
    end
  end

  # GET /especialistas/new
  # GET /especialistas/new.xml
  def new
    @especialista = Especialista.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @especialista }
    end
  end

  # GET /especialistas/1/edit
  def edit
    @especialista = Especialista.find(params[:id])
  end

  # POST /especialistas
  # POST /especialistas.xml
  def create
    @especialista = Especialista.new(params[:especialista])

    respond_to do |format|
      if @especialista.save
        flash[:notice] = 'Especialista se ha creado con exito.'
        format.html { redirect_to(admin_especialistas_url) }
        format.xml  { render :xml => @especialista, :status => :created, :location => @especialista }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @especialista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /especialistas/1
  # PUT /especialistas/1.xml
  def update
    @especialista = Especialista.find(params[:id])

    respond_to do |format|
      if @especialista.update_attributes(params[:especialista])
        flash[:notice] = 'Especialista se ha actualizado con exito.'
        format.html { redirect_to(admin_especialistas_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @especialista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /especialistas/1
  # DELETE /especialistas/1.xml
  def destroy
    @especialista = Especialista.find(params[:id])
    @especialista.destroy

    respond_to do |format|
      format.html { redirect_to(admin_especialistas_url) }
      format.xml  { head :ok }
    end
  end
end
