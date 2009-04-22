# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_comentarios*
#
#  id         :integer(11)     not null, primary key
#  usuario_id :integer(11)
#  foro_id    :integer(11)
#  nombre     :string(50)
#  email      :string(255)
#  mensaje    :text
#  created_at :datetime
#  updated_at :datetime
#  
#  Relaciones con la tabla
#
# Se valida que se registre un nombre, email y un mensaje dentro de un 
# registro dentro de los comentarios de los foros.
# 
# Tiene una relacion de un Foro : llave foranea *foro_id*
#
  
class Comentario < ActiveRecord::Base
  set_table_name('dbm_comentarios')
  belongs_to :foro, :counter_cache => true 
  
  # Se valida que se registre un nombre, email y un mensaje dentro de un 
  # registro dentro de los comentarios de los foros.
  validates_presence_of :nombre, :email, :mensaje, :message => "No puede estar en blanco"
end
