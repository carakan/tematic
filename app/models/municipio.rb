# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_municipios_de_bolivia*
#
#  idMunicipio    :integer(11)     not null, primary key
#  idDepartamento :integer(11)     not null
#  municipio      :string(100)     default(""), not null
#

class Municipio < ActiveRecord::Base
  set_table_name('dbm_municipios_de_bolivia')
  set_primary_key('idMunicipio')
  
  validates_presence_of :municipio, :message => "No puede estar en blanco"
end
