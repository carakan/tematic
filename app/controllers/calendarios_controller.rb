class CalendariosController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
  # GET /calendarios
  # GET /calendarios.xml
  def index
    if params[:busqueda].nil?
      @calendarios = Calendario.paginate(:per_page => 15, :page =>params[:page], :order => 'fecha', :conditions => "tipo = 'F'")
    else
      @calendarios = Calendario.paginate(:per_page => 15, :page =>params[:page], :order => 'fecha', :conditions => ["tipo = 'F' AND (titulo LIKE ? OR resumen LIKE ?)", '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%'])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendarios }
    end
  end
  
  def eventos_concursos
    if params[:busqueda].nil?
      @calendarios = Calendario.paginate(:per_page => 10, :page =>params[:page], :order => 'fecha DESC', :conditions => "tipo <> 'F'")
    else
      @calendarios = Calendario.paginate(:per_page => 10, :page =>params[:page], :order => 'fecha DESC', :conditions => ["tipo <> 'F' AND (titulo LIKE ? OR resumen LIKE ?)", '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%'])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendarios }
    end
  end
  
  def show
    @calendario = Calendario.find(params[:id])
    if request.xhr?
      render :layout => false
    else
      render :layout => true
    end
  end
  
  def mostrar
    fecha = parse_date(params[:fecha]).to_date
    @calendario = Calendario.find(:first, :conditions => ["DAYOFMONTH(fecha) = DAYOFMONTH(?) AND MONTH(fecha) = MONTH(?) AND tipo = 'F'", fecha, fecha])
    if request.xhr?
      render :layout => false
    else
      render :layout => true
    end
  end
  
  protected
  def parse_date(date)
    if date =~ /(\d{1,2})\/(\d{1,2})\/(\d{4})/
      "#{$3}-#{$2}-#{$1}"
    end
  end
end
