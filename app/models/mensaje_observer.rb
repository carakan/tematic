# 
# Observador que envia automaticamente un correo electronico cuando se registra un mensaje.
#
class MensajeObserver < ActiveRecord::Observer
  def after_save(mensaje)
    UserMailer.deliver_mensaje(mensaje.recibido, mensaje.enviado.nombre + ' ' + mensaje.enviado.apellido) if !mensaje.recientemente_creado
  end
  
  
end
