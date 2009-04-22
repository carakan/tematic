# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_asambleistas*
#
#  idAsambleistas    :integer(11)     not null, primary key
#  idDepartamento    :integer(11)     not null
#  idPartidoPolitico :integer(11)     not null
#  nombre            :string(100)     default(""), not null
#  telefono          :string(50)      
#  celular           :string(50)      
#  email             :string(100)     
#
# Clase que representa a la tabla dbm_asambleistas
# Tiene relaciones con las siguientes clases:
# 
# *DepartamentoBolivia*, *PartidoPolitico*
class Asambleista < ActiveRecord::Base
  set_table_name('dbm_asambleistas')
  set_primary_key('idAsambleistas')
  
  belongs_to :departamento, :class_name => 'DepartamentoBolivia', :foreign_key => 'idDepartamento'
  belongs_to :partido_politico, :foreign_key => 'idPartidoPolitico'
  
  # Se valida que se registre un nombre para un asambleista
  validates_presence_of :nombre, :message => "No puede estar en blanco"
  
  # Muestra un listado de los asambleistas, carga ademas los departamentos y el
  # partido politico
  def self.listado(pagina, busqueda)
    busqueda = busqueda.nil? ? '%' : '%' + busqueda + '%'
    self.paginate_by_sql(["SELECT 
      dbm_departamentos_de_bolivia.departamento AS nom_departamento, 
      dbm_partido_politico.sigla AS sigla,
      dbm_partido_politico.partidoPolitico AS partido,
      dbm_asambleistas.nombre,
      dbm_asambleistas.telefono,
      dbm_asambleistas.celular,
      dbm_asambleistas.idAsambleistas,
      dbm_asambleistas.email
    FROM
      dbm_asambleistas
    INNER JOIN dbm_departamentos_de_bolivia ON (dbm_asambleistas.idDepartamento = dbm_departamentos_de_bolivia.idDepartamento)
    INNER JOIN dbm_partido_politico ON (dbm_asambleistas.idPartidoPolitico = dbm_partido_politico.idPartidoPolitico)
    WHERE dbm_asambleistas.nombre LIKE ? ORDER BY dbm_asambleistas.nombre", busqueda], :page => pagina, :per_page => 20 )
  end
end
