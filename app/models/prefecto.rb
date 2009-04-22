# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_prefectos*
#
#  idPrefecto     :integer(11)     not null, primary key
#  idDepartamento :integer(11)     not null
#  nombre         :string(100)     default(""), not null
#  telefono       :string(50)      
#  celular        :string(50)      
#  fax            :string(50)      
#  direccion      :string(100)     
#  email          :string(100)     
#  paginaWeb      :string(100)     
#

class Prefecto < ActiveRecord::Base
  set_table_name('dbm_prefectos')
  set_primary_key('idPrefecto')
  belongs_to :departamento_bolivia, :foreign_key => "idDepartamento"
  
  validates_presence_of :nombre, :message => "No puede estar en blanco"
end
