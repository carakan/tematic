class MensajesController < ApplicationController
  layout 'login'
  
  auto_complete_for :user, :nombre
  
  # Metodo para mostrar los nombre de usuario mediante ajax
  def auto_complete_model_for_user_nombre
    busqueda = '%' + params[:user][:nombre] + '%'
    @usuarios = User.find(:all, :conditions => ["LOWER(nombre) LIKE ? OR LOWER(apellido) LIKE ? OR LOWER(email) LIKE ?", busqueda, busqueda, busqueda], :order => 'nombre ASC', :limit => 8)
    render :partial => 'users/usuarios'
  end

  
  # GET /mensajes
  # GET /mensajes.xml
  def index
    if params[:modo] == 'enviado'
      @mensajes = Mensaje.paginate(:per_page => 20, :page => params[:page], :conditions => ["enviado_id = ?", current_user.id], :order => 'created_at DESC')
      @titulo = 'Mensajes enviados'
    else
      @mensajes = Mensaje.paginate(:per_page => 20, :page => params[:page], :conditions => ["recibido_id = ?", current_user.id], :order => 'created_at DESC')
      @titulo = 'Mensajes recibidos'
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mensajes }
    end
  end

  # GET /mensajes/1
  # GET /mensajes/1.xml
  def show
    @mensaje = Mensaje.find(params[:id])
    
    if @mensaje.recibido_id == current_user.id
      @mensaje.actualizar
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mensaje }
    end
  end

  # GET /mensajes/new
  # GET /mensajes/new.xml
  def new
    @mensaje = Mensaje.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mensaje }
    end
  end

  # GET /mensajes/1/edit
  def edit
    @mensaje = Mensaje.find(params[:id])
  end

  # POST /mensajes
  # POST /mensajes.xml
  def create
    @mensaje = Mensaje.new(params[:mensaje])
    @mensaje.enviado_id = current_user.id
    
    respond_to do |format|
      if @mensaje.save
        flash[:notice] = 'Se envio el mensaje al usuario seleccionado.'
        format.html { redirect_to(mensajes_url) }
        format.xml  { render :xml => @mensaje, :status => :created, :location => @mensaje }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mensaje.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mensajes/1
  # PUT /mensajes/1.xml
  def update
    @mensaje = Mensaje.find(params[:id])

    respond_to do |format|
      if @mensaje.update_attributes(params[:mensaje])
        flash[:notice] = 'Mensaje was successfully updated.'
        format.html { redirect_to(mensajes_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mensaje.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mensajes/1
  # DELETE /mensajes/1.xml
  def destroy
    @mensaje = Mensaje.find(params[:id])
    @mensaje.destroy

    respond_to do |format|
      format.html { redirect_to(mensajes_url) }
      format.xml  { head :ok }
    end
  end
end
