# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_cargo*
#
#  idCargo :integer(11)     not null, primary key
#  cargo   :string(100)     default(""), not null
#
# Clase que representa a la tabla dbm_cargo
# No tiene relaciones con ninguna tabla.
class Cargo < ActiveRecord::Base
  set_table_name('dbm_cargo')
  set_primary_key('idCargo')
  
  # Se valida que se registre un cargo
  validates_presence_of :cargo, :message => "No puede estar en blanco"
end
