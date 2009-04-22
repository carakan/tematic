# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_departamentos_de_bolivia*
#
#  idDepartamento :integer(11)     not null, primary key
#  departamento   :string(50)      default(""), not null
#
# Departamentos de Bolivia sin su descripcion
#

class DepartamentoBolivia < ActiveRecord::Base
  set_table_name('dbm_departamentos_de_bolivia')
  set_primary_key('idDepartamento')
  
  # Se valida que se registre un departamento
  validates_presence_of :departamento, :message => "No puede estar en blanco"
  
  # Muestra las opciones para los selects
  def self.seleccion
    self.find(:all).collect { |x| [x.departamento, x.idDepartamento]}
  end
end
