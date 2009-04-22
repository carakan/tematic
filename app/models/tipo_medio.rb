# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_tipo_de_medio*
#
#  idTipoMedio :integer(11)     not null, primary key
#  tipoMedio   :string(100)     default(""), not null
#

class TipoMedio < ActiveRecord::Base
  set_table_name('dbm_tipo_de_medio')
  set_primary_key('idTipoMedio')
  
  validates_presence_of :tipoMedio, :message => "No puede estar en blanco"
end
