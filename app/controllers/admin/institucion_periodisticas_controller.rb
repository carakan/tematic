class Admin::InstitucionPeriodisticasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /institucion_periodisticas
  # GET /institucion_periodisticas.xml
  def index
    if params[:tipo_medio_id].nil?
      if params[:busqueda].nil?
        @institucion_periodisticas = InstitucionPeriodistica.paginate(:per_page => 20, :page => params[:page])
      else
        @institucion_periodisticas = InstitucionPeriodistica.paginate(:per_page => 20, :page => params[:page], :conditions => ["institucion LIKE ? OR sigla LIKE ? OR direccion LIKE ?", '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%'])
      end 
    else
      if params[:busqueda].nil?
        @institucion_periodisticas = InstitucionPeriodistica.paginate_by_idTipoMedio(params[:tipo_medio_id], :per_page => 20, :page => params[:page])
      else
        @institucion_periodisticas = InstitucionPeriodistica.paginate_by_idTipoMedio(params[:tipo_medio_id], :per_page => 20, :page => params[:page], :conditions => ["institucion LIKE ? OR sigla LIKE ? OR direccion LIKE ?", '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%'])
      end 
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @institucion_periodisticas }
      format.print{ @institucion_periodisticas = InstitucionPeriodistica.find(:all); render :layout => 'imprimir' }
    end
  end

  # GET /institucion_periodisticas/1
  # GET /institucion_periodisticas/1.xml
  def show
    @institucion_periodistica = InstitucionPeriodistica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @institucion_periodistica }
    end
  end

  # GET /institucion_periodisticas/new
  # GET /institucion_periodisticas/new.xml
  def new
    @institucion_periodistica = InstitucionPeriodistica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @institucion_periodistica }
    end
  end

  # GET /institucion_periodisticas/1/edit
  def edit
    @institucion_periodistica = InstitucionPeriodistica.find(params[:id])
  end

  # POST /institucion_periodisticas
  # POST /institucion_periodisticas.xml
  def create
    @institucion_periodistica = InstitucionPeriodistica.new(params[:institucion_periodistica])

    respond_to do |format|
      if @institucion_periodistica.save
        flash[:notice] = 'Institucion Periodistica se ha creado con exito.'
        format.html { redirect_to(admin_institucion_periodisticas_url) }
        format.xml  { render :xml => @institucion_periodistica, :status => :created, :location => @institucion_periodistica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @institucion_periodistica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /institucion_periodisticas/1
  # PUT /institucion_periodisticas/1.xml
  def update
    @institucion_periodistica = InstitucionPeriodistica.find(params[:id])

    respond_to do |format|
      if @institucion_periodistica.update_attributes(params[:institucion_periodistica])
        flash[:notice] = 'Institucion Periodistica se ha actualizado con exito.'
        format.html { redirect_to(admin_institucion_periodisticas_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @institucion_periodistica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /institucion_periodisticas/1
  # DELETE /institucion_periodisticas/1.xml
  def destroy
    @institucion_periodistica = InstitucionPeriodistica.find(params[:id])
    @institucion_periodistica.destroy

    respond_to do |format|
      format.html { redirect_to(admin_institucion_periodisticas_url) }
      format.xml  { head :ok }
    end
  end
end
