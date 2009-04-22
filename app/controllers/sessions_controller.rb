# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
  filter_parameter_logging :password
  
  # render new.rhtml
  def new
    respond_to do |format|
      format.html # index.html.erb
      format.js   {}
    end
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      current_user.update_attribute(:total, current_user.total + 1)
      redirect_back_or_default(params[:url] || '/')
      flash[:notice] = "Usted ingreso satisfactoriamente"
    else
      flash[:notice] = "Usuario o contreseña incorrectos."
      redirect_to(params[:url])
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "Usted salio del Banco Tem&aacute;tico satisfactoriamente."
    redirect_back_or_default('/')
  end
end
