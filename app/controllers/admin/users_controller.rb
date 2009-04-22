class Admin::UsersController < ApplicationController
  layout 'admin'
  require_role "administrador"  
  # GET /estudiantes
  # GET /estudiantes.xml
  def index
    unless params[:busqueda].blank?
      @usuarios = User.paginate(:per_page => 20, :page => params[:page], :order => 'nombre, apellido', :include => :profesion, :conditions => ['nombre like ? OR apellido like ? OR email like ?', '%'+params[:busqueda]+'%', '%'+params[:busqueda]+'%', '%'+params[:busqueda]+'%'])
    else
      @usuarios = User.paginate(:per_page => 20, :page => params[:page], :order => 'nombre, apellido', :include => :profesion)
    end
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @usuarios.to_xml }
      format.js
      format.print { @usuarios = User.find(:all, :order => "nombre, apellido"); render :layout => 'imprimir'}
    end
  end
  
  # GET /estudiantes/1
  # GET /estudiantes/1.xml
  def show
    @usuario = User.find(params[:id])
    
    respond_to do |format|
      format.html { render :partial => 'show', :layout => true}
      format.xml  { render :xml => @usuario.to_xml }
    end
  end
  
  # GET /estudiantes/new
  def new
    @usuario = User.new
  end
  
  # GET /estudiantes/1;edit
  def edit
    @user = User.find(params[:id])
  end
  
  # POST /estudiantes
  # POST /estudiantes.xml
  def create
    @usuario = User.new(params[:user])
    mensaje = ''
    respond_to do |format|
      if @usuario.save
        if params[:activate].to_i == 1
          @usuario.activate
        end
        if params[:correo].to_i == 1
          UserMailer.deliver_signup(@usuario)
        end
        flash[:notice] = mensaje + _('Inscrito se ha creado con exito.')
        format.html { redirect_to admin_users_url }
        format.xml  { head :created, :location => admin_users_url }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors.to_xml }
      end
    end
  end
  
  # PUT /estudiantes/1
  # PUT /estudiantes/1.xml
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = _('Los datos del usuario se han actualizado con exito.')
        if params[:correo].to_i == 1
          UserMailer.deliver_actualizacion(@user)
        end
        format.html { redirect_to admin_users_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors.to_xml }
      end
    end
  end
  
  # DELETE /estudiantes/1
  # DELETE /estudiantes/1.xml
  def destroy
    @usuario = User.find(params[:id])
    @usuario.destroy
    flash[:notice] = _('Se a eliminado al usuario de la base de datos.')
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.xml  { head :ok }
    end
  end
  
  def buscar
    unless params[:busqueda].blank?
      @usuarios = User.paginate(:per_page => 20, :page => params[:page], :order => 'nombre, apellido', :conditions => ['nombre like ? OR apellido like ? OR email like ?', '%'+params[:busqueda]+'%', '%'+params[:busqueda]+'%', '%'+params[:busqueda]+'%'])
    else
      @usuarios = User.paginate(:per_page => 20, :page => params[:page], :order => 'nombre, apellido')
    end
    respond_to do |format|
      format.html { render :action => 'index' }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def envio_correos
    for usuario in Member.find(:all)
      UserMailer.deliver_signup(usuario)
    end
  end
  
  def mostrar
    
  end

  def enviar
  
  end
end