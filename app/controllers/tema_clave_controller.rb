class TemaClaveController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
  before_filter :busqueda, :except => [:show_comparativa, :show_cronologia, :show_ocurrencias]
  
  def agua
    
  end

  def asamblea_constituyente
  end

  def coca
  end

  def economia
  end

  def educacion
  end

  def hidrocarburos
  end

  def interculturalidad
  end

  def migracion
  end

  def mineria
  end

  def tierra_territorio
  end
  
  def show_comparativa
    @comparacion = SerieComparativa.find(params[:id])
    colocarenlaces @comparacion, '/tema_clave/show_comparativa/'
  end
  
  def show_cronologia
    @cronologia = SerieCronologica.find(params[:id])
    colocarenlaces @cronologia, '/tema_clave/show_cronologia/'
  end
  
  def show_ocurrencias
    @tag = Tag.find(params[:id])
    contador @tag.descripcion
  end
  
  private
  def busqueda
    @descriptor = DescriptorEspecifico.find(params[:id], :include => :descriptor_generico) 
    if(params[:ini] != '' && params[:fin] != '')
      @cronologicas = SerieCronologica.listado(params[:id], params[:page_cro], params[:b_cro], params[:ini], params[:fin])
      @comparativas = SerieComparativa.listado(params[:id], params[:page_com], nil)
    elsif !params[:pais].nil?
      @cronologicas = SerieCronologica.listado(params[:id], params[:page_cro], nil)
      @comparativas = SerieComparativa.listado(params[:id], params[:page_com], params[:b_com])
    else
      @cronologicas = SerieCronologica.listado(params[:id], params[:page_cro], params[:b_cro])
      @comparativas = SerieComparativa.listado(params[:id], params[:page_com], params[:b_com])
    end
    render :action => 'agua'
  end
  
  def contador(descripcion)
    # Aumentar las tablas en donde se buscará la DESCRIPCION    
    @serie_cronologicas = SerieCronologica.paginate(:per_page => 10, :page => params[:page_cro], :order=>"fechaYear DESC",:conditions => ['hecho like ? OR contexto like ? OR gobierno like ? OR fuentes like ?', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%'])
    @serie_comparativas=SerieComparativa.paginate(:per_page => 10, :page => params[:page_com], :conditions => ['hecho like ? OR contexto like ? OR gobierno like ? OR fuentes like ?', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%'])
    @valores = ValorNoticia.paginate(:per_page => 10, :page => params[:page_val],:conditions=>['titulo like ? OR autor like ? OR descripcion like ?','%'+descripcion+'%','%'+descripcion+'%','%'+descripcion+'%'])
    @primera_manos = PrimeraMano.paginate(:per_page => 10, :page => params[:page_pri], :conditions=>['titular like ? OR presentacion like ? OR fuentes like ?', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%'])
    
    numero_registros=0
    numero_registros+=@serie_cronologicas.length
    numero_registros+=@serie_comparativas.length
    numero_registros+=@valores.length
    numero_registros+=@primera_manos.length
  end
end
