# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_ministerios*
#
#  idMinisterios  :integer(11)     not null, primary key
#  idDepartamento :integer(11)     not null
#  ministerio     :string(100)     default(""), not null
#  responsable    :string(100)     default(""), not null
#  direccion      :string(100)     
#  telefono       :string(50)      
#  celular        :string(100)     
#  fax            :string(50)      
#  casilla        :string(50)      
#  email          :string(100)     
#  paginaWeb      :string(100)     
#  
#  Tiene una relacion de un *DepartamentoBolivia*: llave foranea => *idDepartamento*
#

class Ministerio < ActiveRecord::Base
  set_table_name('dbm_ministerios')
  set_primary_key('idMinisterios')
  belongs_to :departamento_bolivia, :foreign_key => "idDepartamento"
  
  validates_presence_of :ministerio, :responsable, :message => "No puede estar en blanco"
end
