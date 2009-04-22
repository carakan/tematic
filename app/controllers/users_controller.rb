class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  layout 'login'
  skip_before_filter :login_required
  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      # Borrar esto para que se pueda activar por correo
      # @user.activate
      
      flash[:notice] = "Gracias por registrarse!"
      render :action => 'felicitaciones'
    else
      render :action => 'new'
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Activacion completada!"
    else
      flash[:notice] = "No se encontro la clave de activacion!"
    end
    redirect_back_or_default('/')
  end
  
  def forgot_password
    return unless request.post?
    if @user = User.find_by_email(params[:email])
      @user.forgot_password
      
        flash[:notice] = "Hemos envíado un enlace para resetear la contraseña a su correo electrónico." 
      
    else
      flash[:notice] = "No se ha encontrado ningún usuario con esa dirección de correo electrónico." 
    end
    render :action => "forgot"
  end

  def reset_password 
    return unless request.post?
    @user = User.find_by_password_reset_code(params[:id]) if params[:id]
    if @user.nil? 
      flash[:notice] = "Código inválido."
      return
    else
      flash[:notice] = nil
    end
  end
  
  def change_password
    @user = User.find_by_password_reset_code(params[:id]) if params[:id]
    return if @user unless params[:password]
    begin
      if (params[:password] == params[:password_confirmation])
        @user.password_confirmation = params[:password_confirmation]
        @user.password = params[:password]              
        @user.reset_password
        @user.save!
        flash[:notice] = "Su contraseña ha sido reseteada, ya puede entrar con la nueva contraseña."
        redirect_back_or_default(root_path)                  
      else
        flash[:notice] = "Las contraseñas no coinciden."
        render :action => 'reset_password'
      end
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = "Por favor introduzca información válida."
      render :action => 'reset_password'
    end
  end
end
