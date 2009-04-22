# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_instituciones*
#
#  idInstituciones   :integer(11)     not null, primary key
#  idTipoInstitucion :integer(11)     not null
#  idDepartamento    :integer(11)     not null
#  institucion       :string(100)     default(""), not null
#  sigla             :string(30)      
#  direccion         :string(100)     
#  telefono          :string(50)      
#  fax               :string(50)      
#  casilla           :string(50)      
#  email             :string(100)     
#  paginaWeb         :string(100)     
#  
#  
#

class Institucion < ActiveRecord::Base
  set_table_name('dbm_instituciones')
  set_primary_key('idInstituciones')
  
  belongs_to :tipo_institucion, :foreign_key => 'idTipoInstitucion'
  belongs_to :departamento_bolivia, :foreign_key => 'idDepartamento'
  
  validates_presence_of :institucion, :message => "No puede estar en blanco"
  # Muestra un listado de los asambleistas, carga ademas los departamentos y el
  # partido politico
  def self.listado(pagina, busqueda)
    busqueda = busqueda.nil? ? '%' : '%' + busqueda + '%'
    self.paginate_by_sql(["SELECT 
      dbm_instituciones.idInstituciones,
      dbm_instituciones.institucion,
      dbm_instituciones.sigla,
      dbm_departamentos_de_bolivia.departamento AS departamento,
      dbm_tipo_de_institucion.tipoInstitucion as tipo_institucion
    FROM
      dbm_instituciones
    INNER JOIN dbm_departamentos_de_bolivia ON (dbm_instituciones.idDepartamento = dbm_departamentos_de_bolivia.idDepartamento)
    INNER JOIN dbm_tipo_de_institucion ON (dbm_instituciones.idTipoInstitucion = dbm_tipo_de_institucion.idTipoInstitucion)
    WHERE dbm_instituciones.institucion LIKE ? ORDER BY dbm_instituciones.institucion", busqueda], :page => pagina, :per_page => 20 )
  end
end
