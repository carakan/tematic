class Admin::SerieComparativasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /serie_comparativas
  # GET /serie_comparativas.xml
  def index
    if params[:busqueda].nil?
      @serie_comparativas = SerieComparativa.paginate(:per_page => 20, :page => params[:page])
    else
      @serie_comparativas = SerieComparativa.paginate(:per_page => 20, :page => params[:page], :conditions => ["hecho LIKE ? OR contexto LIKE ?", '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%'] )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @serie_comparativas }
    end
  end

  # GET /serie_comparativas/1
  # GET /serie_comparativas/1.xml
  def show
    @serie_comparativa = SerieComparativa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @serie_comparativa }
    end
  end

  # GET /serie_comparativas/new
  # GET /serie_comparativas/new.xml
  def new
    @serie_comparativa = SerieComparativa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @serie_comparativa }
    end
  end

  # GET /serie_comparativas/1/edit
  def edit
    @serie_comparativa = SerieComparativa.find(params[:id])
  end

  # POST /serie_comparativas
  # POST /serie_comparativas.xml
  def create
    @serie_comparativa = SerieComparativa.new(params[:serie_comparativa])
 
    respond_to do |format|
      if @serie_comparativa.save
        flash[:notice] = 'SerieComparativa se ha creado con exito.'
        format.html { redirect_to(admin_serie_comparativas_path) }
        format.xml  { render :xml => @serie_comparativa, :status => :created, :location => @serie_comparativa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @serie_comparativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /serie_comparativas/1
  # PUT /serie_comparativas/1.xml
  def update
    @serie_comparativa = SerieComparativa.find(params[:id])

    respond_to do |format|
      if @serie_comparativa.update_attributes(params[:serie_comparativa])
        flash[:notice] = 'La Serie Comparativa se actualizo con exitos.'
        format.html { redirect_to(admin_serie_comparativas_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @serie_comparativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /serie_comparativas/1
  # DELETE /serie_comparativas/1.xml
  def destroy
    @serie_comparativa = SerieComparativa.find(params[:id])
    @serie_comparativa.destroy
    flash[:notice] = 'La Serie Comparativa se borro con exito.'
    respond_to do |format|
      format.html { redirect_to(admin_serie_comparativas_path) }
      format.xml  { head :ok }
    end
  end
  
  def cambio
  end
  
  def busqueda
    @serie_comparativa = SerieComparativa.new
  end
  
  def btodo
     serie = SerieComparativa.new(params[:serie_comparativa])
     @serie_comparativas = serie.busqueda(params[:page])
      render :action => :index
  end
end
