# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_partido_politico*
#
#  idPartidoPolitico :integer(11)     not null, primary key
#  sigla             :string(50)      default(""), not null
#  partidoPolitico   :string(100)     
#

class PartidoPolitico < ActiveRecord::Base
  set_table_name('dbm_partido_politico')
  set_primary_key('idPartidoPolitico')
  
  validates_presence_of :sigla, :partidoPolitico, :message => "No puede estar en blanco."
end
