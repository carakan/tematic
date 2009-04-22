# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_foros*
#
#  id                :integer(11)     not null, primary key
#  titulo            :string(255)
#  mensaje           :text
#  puntuacion        :integer(5)
#  created_at        :datetime
#  updated_at        :datetime
#  user_id           :integer(11)
#  contador          :integer(11)     default(0)
#  comentarios_count :integer(11)     default(0)
#  autor             :string(255)
#  
#  Tabla que representa los registros de los foros que anteriormente se desarrollaban en otro
#  sistema.
#  
#  El campo *comentarios_count* representa los comentarios añadidos a registro del foro.
#

class Foro < ActiveRecord::Base
  set_table_name('dbm_foros')
  belongs_to :user
  has_many :comentarios
  
  validates_presence_of :titulo, :mensaje, :autor, :message => "No puede estar en blanco"
end
