class Admin::MinisteriosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /ministerios
  # GET /ministerios.xml
  def index
    if params[:busqueda].nil?
      @ministerios = Ministerio.paginate(:per_page => 20, :page => params[:page])
    else
      @ministerios = Ministerio.paginate(:per_page => 20, :page => params[:page], :conditions => ["ministerio LIKE ? OR responsable LIKE ? OR email LIKE ?", '%' + params[:busqueda] + '%','%' + params[:busqueda] + '%','%' + params[:busqueda] + '%' ] )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ministerios }
      format.print{ @ministerios = Ministerio.find(:all); render :layout => 'imprimir' }
    end
  end

  # GET /ministerios/1
  # GET /ministerios/1.xml
  def show
    @ministerio = Ministerio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ministerio }
    end
  end

  # GET /ministerios/new
  # GET /ministerios/new.xml
  def new
    @ministerio = Ministerio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ministerio }
    end
  end

  # GET /ministerios/1/edit
  def edit
    @ministerio = Ministerio.find(params[:id])
  end

  # POST /ministerios
  # POST /ministerios.xml
  def create
    @ministerio = Ministerio.new(params[:ministerio])

    respond_to do |format|
      if @ministerio.save
        flash[:notice] = 'Ministerio se ha creado con exito.'
        format.html { redirect_to(admin_ministerios_url) }
        format.xml  { render :xml => @ministerio, :status => :created, :location => @ministerio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ministerio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ministerios/1
  # PUT /ministerios/1.xml
  def update
    @ministerio = Ministerio.find(params[:id])

    respond_to do |format|
      if @ministerio.update_attributes(params[:ministerio])
        flash[:notice] = 'Ministerio se ha actualizado con exito.'
        format.html { redirect_to(admin_ministerios_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ministerio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ministerios/1
  # DELETE /ministerios/1.xml
  def destroy
    @ministerio = Ministerio.find(params[:id])
    @ministerio.destroy

    respond_to do |format|
      format.html { redirect_to(admin_ministerios_url) }
      format.xml  { head :ok }
    end
  end
end
