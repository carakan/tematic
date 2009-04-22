# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_paises*
#
#  idPais :integer(11)     not null, primary key
#  pais   :string(100)     
#  
#  Representa el registro de los diferentes paises.
#

class Paise < ActiveRecord::Base
  set_table_name('dbm_paises')
  set_primary_key('idPais')
  
  validates_presence_of :pais, :message => "No puede estar en blanco."
  validates_uniqueness_of :pais, :message => "Tiene que ser unico el nombre."
end
