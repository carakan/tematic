class Admin::PrefectosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /prefectos
  # GET /prefectos.xml
  def index
    @prefectos = Prefecto.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prefectos }
    end
  end

  # GET /prefectos/1
  # GET /prefectos/1.xml
  def show
    @prefecto = Prefecto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prefecto }
    end
  end

  # GET /prefectos/new
  # GET /prefectos/new.xml
  def new
    @prefecto = Prefecto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prefecto }
    end
  end

  # GET /prefectos/1/edit
  def edit
    @prefecto = Prefecto.find(params[:id])
  end

  # POST /prefectos
  # POST /prefectos.xml
  def create
    @prefecto = Prefecto.new(params[:prefecto])

    respond_to do |format|
      if @prefecto.save
        flash[:notice] = 'Prefecto se ha creado con exito.'
        format.html { redirect_to(admin_prefectos_url) }
        format.xml  { render :xml => @prefecto, :status => :created, :location => @prefecto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prefecto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prefectos/1
  # PUT /prefectos/1.xml
  def update
    @prefecto = Prefecto.find(params[:id])

    respond_to do |format|
      if @prefecto.update_attributes(params[:prefecto])
        flash[:notice] = 'Prefecto se ha actualizado con exito.'
        format.html { redirect_to(admin_prefectos_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prefecto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prefectos/1
  # DELETE /prefectos/1.xml
  def destroy
    @prefecto = Prefecto.find(params[:id])
    @prefecto.destroy

    respond_to do |format|
      format.html { redirect_to(admin_prefectos_url) }
      format.xml  { head :ok }
    end
  end
end
