class Admin::InstitucionsController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /institucions
  # GET /institucions.xml
  def index
    if params[:busqueda].nil?
      @institucions = Institucion.paginate(:per_page => 20, :page => params[:page])
    else
      @institucions = Institucion.paginate(:per_page => 20, :page => params[:page], :conditions => ["institucion LIKE ? OR sigla LIKE ? OR direccion LIKE ?", '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%'])
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @institucions }
      format.print{ @institucions = Institucion.find(:all); render :layout => 'imprimir' }
    end
  end

  # GET /institucions/1
  # GET /institucions/1.xml
  def show
    @institucion = Institucion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @institucion }
    end
  end

  # GET /institucions/new
  # GET /institucions/new.xml
  def new
    @institucion = Institucion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @institucion }
    end
  end

  # GET /institucions/1/edit
  def edit
    @institucion = Institucion.find(params[:id])
  end

  # POST /institucions
  # POST /institucions.xml
  def create
    @institucion = Institucion.new(params[:institucion])

    respond_to do |format|
      if @institucion.save
        flash[:notice] = 'Institucion se ha creado con exito.'
        format.html { redirect_to(admin_institucions_url) }
        format.xml  { render :xml => @institucion, :status => :created, :location => @institucion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @institucion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /institucions/1
  # PUT /institucions/1.xml
  def update
    @institucion = Institucion.find(params[:id])

    respond_to do |format|
      if @institucion.update_attributes(params[:institucion])
        flash[:notice] = 'Institucion se ha actualizado con exito.'
        format.html { redirect_to(admin_institucions_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @institucion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /institucions/1
  # DELETE /institucions/1.xml
  def destroy
    @institucion = Institucion.find(params[:id])
    @institucion.destroy

    respond_to do |format|
      format.html { redirect_to(admin_institucions_url) }
      format.xml  { head :ok }
    end
  end
end
