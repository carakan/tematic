class Admin::LegislacionsController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /legislacions
  # GET /legislacions.xml
  def index
    @legislacions = Legislacion.busqueda(params[:page], params[:generico], params[:buscar], 20)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @legislacions }
    end
  end

  # GET /legislacions/1
  # GET /legislacions/1.xml
  def show
    @legislacion = Legislacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @legislacion }
    end
  end

  # GET /legislacions/new
  # GET /legislacions/new.xml
  def new
    @legislacion = Legislacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @legislacion }
    end
  end

  # GET /legislacions/1/edit
  def edit
    @legislacion = Legislacion.find(params[:id])
  end

  # POST /legislacions
  # POST /legislacions.xml
  def create
    @legislacion = Legislacion.new(params[:legislacion])

    respond_to do |format|
      if @legislacion.save
        flash[:notice] = 'Legislacion se ha creado con exito.'
        format.html { redirect_to(admin_legislacions_url) }
        format.xml  { render :xml => @legislacion, :status => :created, :location => @legislacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @legislacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /legislacions/1
  # PUT /legislacions/1.xml
  def update
    @legislacion = Legislacion.find(params[:id])

    respond_to do |format|
      if @legislacion.update_attributes(params[:legislacion])
        flash[:notice] = 'Legislacion se ha actualizado con exito.'
        format.html { redirect_to(admin_legislacions_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @legislacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /legislacions/1
  # DELETE /legislacions/1.xml
  def destroy
    @legislacion = Legislacion.find(params[:id])
    @legislacion.destroy

    respond_to do |format|
      format.html { redirect_to(admin_legislacions_url) }
      format.xml  { head :ok }
    end
  end
end
