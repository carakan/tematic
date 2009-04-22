class DirectorioController < ApplicationController
  layout 'login'
  
  def alcaldes
    if params[:departamento].nil?
      @alcaldes = Alcalde.listado(params[:id], params[:page], params[:busqueda])
    else
      @alcaldes = Alcalde.listado(params[:departamento], params[:page], params[:busqueda])
    end
  end

  def asambleistas
    @asambleistas = Asambleista.listado(params[:page], params[:busqueda])
  end

  def especialistas
    busqueda = params[:busqueda].nil? ? '%' : '%' + params[:busqueda] + '%'
    if params[:especialidad].nil?
      @especialistas=Especialista.paginate(:per_page => 20, :page => params[:page], :conditions => ["dbm_especialistas.idDescriptorGenerico = ? AND nombre LIKE ?", params[:id], busqueda], :order => "nombre", :include => :descriptor_generico)
    else
      @especialistas=Especialista.paginate(:per_page => 20, :page => params[:page], :conditions => ["dbm_especialistas.idDescriptorGenerico = ? AND nombre LIKE ?", params[:especialidad], busqueda], :order => "nombre", :include => :descriptor_generico)
    end
  end

  def instituciones
    @instituciones = Institucion.listado(params[:page], params[:busqueda])
  end
  
  def instituciones_periodisticas
    @instituciones = InstitucionPeriodistica.listado(params[:page], params[:busqueda])
  end

  def periodistas
    if params[:departamento]
      @periodistas = Periodista.listado(params[:page],params[:busqueda], params[:departamento])
    elsif params[:institucion]
      @periodistas = Periodista.listado(params[:page],params[:busqueda], nil, params[:institucion])
    end
  end
  
  def prefecturas
    @prefectos = Prefecto.paginate(:per_page => 20, :page => params[:page], :order => "nombre", :include => :departamento_bolivia)
  end

  def ministerios
    busqueda = params[:busqueda].nil? ? '%' : '%' + params[:busqueda] + '%'
    @ministerios = Ministerio.paginate(:per_page => 14, :page => params[:page], :conditions => ["ministerio LIKE ?", busqueda], :order => "ministerio", :include => :departamento_bolivia)
  end
  
  def mostrar
    if params[:ver] == 'alcalde'
      @alcalde = Alcalde.find(params[:id])
      render :partial => 'alcalde', :layout => false
    elsif params[:ver] == 'asambleista'
      @asambleista = Asambleista.find(params[:id])
      render :partial => 'asambleista', :layout => false
    elsif params[:ver] == 'institucion'
      @institucion = Institucion.find(params[:id])
      render :partial => 'institucion', :layout => false
    elsif params[:ver] == 'institucionpe'
      @institucion = InstitucionPeriodistica.find(params[:id])
      render :partial => 'institucionpe', :layout => false
    elsif params[:ver] == 'periodista'
      @periodista = Periodista.find(params[:id])
      render :partial => 'periodista', :layout => false
    elsif params[:ver] == 'prefecto'
      @prefecto = Prefecto.find(params[:id])
      render :partial => 'prefecto', :layout => false
    elsif params[:ver] == 'especialista'
      @especialista = Especialista.find(params[:id])
      render :partial => 'especialista', :layout => false
    elsif params[:ver] == 'ministerio'
      @ministerio = Ministerio.find(params[:id])
      render :partial => 'ministerio', :layout => false
    else
      render :text=>'<h2>No se encuentra</h2>El registro que quiere ver no se encuentra', :layout => false
    end
  end
end
