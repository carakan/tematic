# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_profesiones*
#
#  idProfesion :integer(11)     not null, primary key
#  Profesion   :string(60)      
#

class Profesion < ActiveRecord::Base
  set_table_name('dbm_profesiones')
  set_primary_key('idProfesion')
  
  validates_presence_of :Profesion, :message => "No puede estar en blanco"
end
