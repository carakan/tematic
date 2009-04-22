class Admin::TagsController < ApplicationController
  layout 'admin'
  require_role "administrador"
  
  # GET /tags
  # GET /tags.xml
  def index    
    redirect_to :action => "new"
  end

  # GET /tags/1
  # GET /tags/1.xml
  def show
    @tag = Tag.find(params[:id])
    contador @tag.descripcion
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.xml
  def new
    @tag = Tag.new
    @tags = Tag.paginate(:per_page=>100, :page => params[:page], :order => 'descripcion ASC')
    @tags_nuevos = Tag.find(:all, :conditions => 'enlazados=0')
    seleccionados=@tags.find_all { |i| i.enlazados==0 && i.ocurrencias==0 }
    if seleccionados.length > 0
      mensaje ="Se tiene que actualizar la Base de Datos.<br/>"
      mensaje+="Presione en el enlace <strong style='color:red'>Guardar todos los links</strong>"
      flash[:notice] = mensaje
    end

    respond_to do |format|      
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.xml
  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      @tag.ocurrencias = contador(@tag.descripcion)
      if @tag.save        
        mensaje='Palabra clave creada correctamente: <strong>'+@tag.ocurrencias.to_s+'</strong> ocurrencias.<br/>'
        mensaje+='¡Se necesita actualizar la Base de Datos!'
        flash[:notice] = mensaje
        
        format.html { redirect_to(new_admin_tag_url) }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      @tag.ocurrencias = contador(@tag.descripcion)
      if @tag.update_attributes(params[:tag])        
        flash[:notice] = 'Palabra clave actualizada correctamente: <strong>'+@tag.ocurrencias.to_s+'</strong> ocurrencias.'
        
        format.html { redirect_to(admin_tags_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(admin_tags_url) }
      format.xml  { head :ok }
    end
  end
  
  # Busca en la Base de Datos la cantidad de ocurrencias que hay para 
  # el parámetro :descripcion
  def buscar    
    contador = contador(params[:descripcion])
      
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml  { head :ok }
      format.js {       
        mensaje ='<li><strong>'+contador.to_s+'</strong> ocurrencias de <strong>'+params[:descripcion]+'</strong>'
        if Tag.count(:id, :conditions=>['descripcion like ?','%'+params[:descripcion]+'%']) > 0
          mensaje += ' <strong style="color:red"> YA EXISTE!!!</strong></li>'
        else
          mensaje += '</li>'
        end        
        render :text => mensaje
      }
    end
  end
  
  # Cuenta la cantidad de ocurrencias que tiene una Palabra Clave en la
  # Base de Datos.
  def contar 
    contando
    
    flash[:notice] = 'Se actualizó Ocurrencias y Enlazados con &eacute;xito.'
    @tags = Tag.paginate(:per_page => 20, :page => params[:page])
    
    respond_to do |format|
      format.html { redirect_to(admin_tags_url) }
      format.xml  { head :ok }
    end
  end  
  
  # Guarda las direcciones URL's en la tabla ENLACES, de un determinado TAG.
  def guardar
    tag = Tag.find(params[:id])
    actualizaciones = guardando tag
    
    flash[:notice] = 'Enlaces guardados correctamente: <strong>'+actualizaciones.to_s+'</strong>'
    
    respond_to do |format|
      format.html { redirect_to(admin_tag_path) }
      format.xml  { head :ok }
    end
  end  
  
  # Guarda las URL's, de todas las palabras clave en la tabla ENLACES.
  def guardar_todo
    tags = Tag.find(:all, :conditions=>['enlazados=0 OR enlazados!=ocurrencias']) #Hallamos todas la palabras clave
    actualizaciones=0    
    for tag in tags
      actualizaciones+=guardando tag
      enlazar tag.id
    end
    
    contando
    
    mensaje='N&uacute;mero de links guardados correctamente: <strong>'+actualizaciones.to_s+'</strong><br/>'   
    flash[:notice] = mensaje
    
    respond_to do |format|
      format.html { redirect_to(admin_tags_path) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  # Cuenta el número de ocurrencias en la base de datos
  # del parámetro DESCRIPCION, y también devuelve los registros
  # de las tablas @nom_registros
  def contador(descripcion)
    # Aumentar las tablas en donde se buscará la DESCRIPCION
    @serie_cronologicas=SerieCronologica.find(:all, :conditions => ['hecho like ? OR contexto like ? OR gobierno like ? OR fuentes like ?', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%'])
    @serie_comparativas=SerieComparativa.find(:all, :conditions => ['hecho like ? OR contexto like ? OR gobierno like ? OR fuentes like ?', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%'])
    @valores = ValorNoticia.find(:all,:conditions=>['titulo like ? OR autor like ? OR descripcion like ?','%'+descripcion+'%','%'+descripcion+'%','%'+descripcion+'%'])
    @primera_manos = PrimeraMano.find(:all, :conditions=>['titular like ? OR presentacion like ? OR fuentes like ?', '%'+descripcion+'%', '%'+descripcion+'%', '%'+descripcion+'%'])
    
    numero_registros=0
    numero_registros+=@serie_cronologicas.length
    numero_registros+=@serie_comparativas.length
    numero_registros+=@valores.length
    numero_registros+=@primera_manos.length
  end
  
  # Guarda las direcciones URL's que hay en ARRAY_REGISTROS del registro TAG, 
  # dando como parámetro la URL_RAIZ, que es el lugar donde se ubica la URL de 
  # la palabra clave.
  def guardar_enlaces(tag, array_registros, url_raiz)
    actualizaciones=0
    for registro in array_registros
      if Enlace.count(:all,:conditions=>['tag_id=? AND lactual=?',tag.id,url_raiz+registro.id.to_s])==0
        actualizaciones+=1
        enlace = Enlace.new        
        enlace.lactual = url_raiz+registro.id.to_s
        enlace.lsiguiente = ''
        enlace.tag_id = tag.id
        enlace.save
      end
    end
    actualizaciones #retornar el número de actualizaciones realizadas
  end
  
  # Guarda las direcciones URL's donde haya por lo menos una ocurrencia 
  # de TAG en la Base de Datos, y además cuenta el número de ocurrencias
  # encontradas, cuyo valor es almacenado en la variable ACTUALIZACIONES.
  def guardando(tag)    
    contador(tag.descripcion)
    
    # Agregar las raices de las direcciones URL's
    actualizaciones=0
    actualizaciones+=guardar_enlaces tag, @serie_cronologicas, '/tema_clave/show_cronologia/'
    actualizaciones+=guardar_enlaces tag, @serie_comparativas, '/tema_clave/show_comparativa/'
    actualizaciones+=guardar_enlaces tag, @valores, '/biblioteca/valor_noticia/'
    actualizaciones+=guardar_enlaces tag, @primera_manos, '/primera_manos/'
    actualizaciones
  end
  
  # Enlaza los links, de la tabla ENLACES, para que cada link apunte 
  # al siguiente. El parámetro TAG_ID indica el ID del tag (palabra clave) 
  # que se está enlazando. Se pueden usar otros criterios para enlazar.
  def enlazar(tag_id)
    enlaces = Enlace.find(:all, :conditions=>['tag_id=?',tag_id])
    num = enlaces.length
    if num>1
      for i in (0..num-2)
        enlaces[i].lsiguiente = enlaces[i+1].lactual
        enlaces[i].save
      end
      enlaces[num-1].lsiguiente = enlaces[0].lactual
      enlaces[num-1].save
    end
  end
  
  # Actualiza la tabla TAGS, en los campos OCURRENCIAS y ENLAZADOS. Para 
  # ocurrencias busca en la base de datos y obtiene la cantidad de ocurrencias. 
  # Para enlazados cuenta cuantos enlaces tiene cada tag, en la tabla ENLACES.
  def contando
    tags = Tag.find(:all)
    
    for tag in tags
      tag.ocurrencias = contador tag.descripcion      
      tag.enlazados = Enlace.count(:all, :conditions =>['tag_id = ?', tag.id])
      
      tag.save
    end    
  end
end
