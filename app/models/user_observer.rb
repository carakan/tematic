# Observador que envia automaticamente envia a un correo para el registro y la confirmacion
# de un usuario.

class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.deliver_signup_notification(user)
  end

  def after_save(user)
    UserMailer.deliver_activation(user) if user.recently_activated?
    UserMailer.deliver_reset_password(user) if user.recently_reset_password?
  end
  
  def after_update(user)
    UserMailer.deliver_forgot_password(user) if user.recently_forgot_password?
    
  end
end
