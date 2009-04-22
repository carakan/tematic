# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_mensajes*
#
#  id          :integer(11)     not null, primary key
#  titulo      :string(255)
#  mensaje     :text
#  leido       :boolean(1)      not null
#  enviado_id  :integer(11)
#  recibido_id :integer(11)
#  created_at  :datetime
#  updated_at  :datetime
#  
# Mensaje que se envian entre los usuarios del sitio, Tiene un titulo y un mensaje, 
# 
# El campo: *enviado_id* es el id en *User* que enlaza al usuario que envio el mensaje.
# 
# El *recibido_id* es el id en *User* al que le llega el mensaje.
# 
# El campo *leido* es un booleano que indica si el usuario al que se le envio el mensaje
# realmente lo leyo.
#

class Mensaje < ActiveRecord::Base
  set_table_name('dbm_mensajes')
  
  validates_presence_of :titulo, :mensaje, :enviado_id, :recibido_id, :message => "No puede estar en blanco."
  
  belongs_to :enviado, :class_name => 'User', :foreign_key => 'enviado_id'
  belongs_to :recibido, :class_name => 'User', :foreign_key => 'recibido_id'
  
  def actualizar
    @creado = true
    self.update_attribute(:leido, true)
  end
  
  def recientemente_creado
    @creado
  end
end
