# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_tipo_de_institucion*
#
#  idTipoInstitucion :integer(11)     not null, primary key
#  tipoInstitucion   :string(100)     default(""), not null
#

class TipoInstitucion < ActiveRecord::Base
  set_table_name('dbm_tipo_de_institucion')
  set_primary_key('idTipoInstitucion')
  
  validates_presence_of :tipoInstitucion, :message => "No puede estar en blanco"
end
