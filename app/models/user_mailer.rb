# Representa al envio de emails a todos los usuarios que estan registrados dentro de la 
# base de datos del *Banco_Tematico* esto es que se envia un correo al momento de registrase
# y luego se le reenviara para que confirme su correo y poder confirmar si realmente los 
# datos introducidos son los correctos.
#
# Ademas mediante esta clase se envia el boletin de informacion del *Banco_Tematico*
#

class UserMailer < ActionMailer::Base
  def signup(usuario)
    setup_email(usuario)
    @subject    += _(' Su cuenta ha sido actualizada')
    @body[:url]  = SITE
  end
  
  def actualizacion(usuario)
    setup_email(usuario)
    @subject    += _(' Su cuenta ha sido actualizada')
    @body[:url]  = SITE_URL
  end
  
  def signup_notification(user)
    setup_email(user)
    @subject    += ' Activacion de su cuenta de usuario'
    @body[:url]  = SITE_URL + "/activate/#{user.activation_code}"
  end
  
  def forgot_password(user)
    setup_email(user)
    @subject    += ' Contraseña olvidada'
    @body[:url]  = SITE_URL + "/users/reset_password/#{user.password_reset_code}" 
  end

  def reset_password(user)
    setup_email(user)
    @subject    += ' Su contraseña ha sido reseteada.'
  end
  
  def activation(user)
    setup_email(user)
    @subject    += ' Su cuenta ha sido creada y activada con exito.'
    @body[:url]  = SITE_URL
  end
  
  def mensaje(user, from)
    setup_email(user)
    @subject    += ': ' + from + " te envio un mensaje."
    @body[:enviado]  = from
    @body[:url]  = SITE_URL + "/mensajes/"
  end
  
  protected
  def setup_pass(user)
    @recipients  = "#{user.email_smember}"
    @from        = SITE_MAIL
    @subject     = SITE_NAME
    @sent_on     = Time.now
    @content_type = 'text/html'
    @body[:usuario] = user
  end
  
  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = SITE_MAIL
    @subject     = SITE_NAME
    @sent_on     = Time.now
    @content_type = 'text/html'
    @body[:usuario] = user
  end
end
