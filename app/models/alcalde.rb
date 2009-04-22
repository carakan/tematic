# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_alcaldes*
#
#  idAlcaldes        :integer(11)     not null, primary key
#  idDepartamento    :integer(11)     not null
#  idMunicipio       :integer(11)     not null
#  idPartidoPolitico :integer(11)     not null
#  nombre            :string(100)     default(""), not null
#  telefono          :string(50)      
#  celular           :string(50)      
#  email             :string(100)     
#  paginaWeb         :string(100)     
#
# Clase que representa a la tabla dbm_alcaldes
# Tiene relaciones con las siguientes clases de uno:
# 
# *DepartamentoBolivia* llave foranea: idDepartamento, 
# 
# *Municipio* llave foranea: idMunicipio, 
# 
# *PartidoPolitico* llave foranea: idPartidoPolitico
#
class Alcalde < ActiveRecord::Base
  set_table_name('dbm_alcaldes')
  set_primary_key('idAlcaldes')
  
  belongs_to :departamento, :class_name => 'DepartamentoBolivia', :foreign_key => 'idDepartamento'
  belongs_to :municipio, :foreign_key => 'idMunicipio'
  belongs_to :partido_politico, :foreign_key => 'idPartidoPolitico'
  
  # Se valida que se registre un nombre para un alcalde
  validates_presence_of :nombre, :message => "No puede estar en blanco"
  
  # Muestra un listado de los alcaldes, carga ademas los departamentos y el
  # municipio del alcalde
  def self.listado(departamento, pagina, busqueda)
    busqueda = busqueda.nil? ? '%' : '%' + busqueda + '%'
    self.paginate_by_sql(["SELECT 
      dbm_alcaldes.idAlcaldes,
      dbm_alcaldes.idDepartamento,
      dbm_alcaldes.nombre,
      dbm_departamentos_de_bolivia.departamento AS nom_departamento,
      dbm_municipios_de_bolivia.municipio AS nom_municipio
    FROM
      dbm_alcaldes
    INNER JOIN dbm_departamentos_de_bolivia ON (dbm_alcaldes.idDepartamento = dbm_departamentos_de_bolivia.idDepartamento)
    INNER JOIN dbm_municipios_de_bolivia ON (dbm_alcaldes.idMunicipio = dbm_municipios_de_bolivia.idMunicipio)
    WHERE (dbm_alcaldes.idDepartamento = ? AND dbm_alcaldes.nombre LIKE ?) ORDER BY dbm_alcaldes.nombre", departamento, busqueda], :page => pagina, :per_page => 20 )
  end
end
