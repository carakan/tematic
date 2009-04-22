# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_instituciones_periodisticas*
#
#  idInstituciones :integer(11)     not null, primary key
#  idTipoMedio     :integer(11)     not null
#  idDepartamento  :integer(11)     not null
#  institucion     :string(100)     default(""), not null
#  sigla           :string(30)      
#  direccion       :string(100)     
#  telefono        :string(50)      
#  fax             :string(50)      
#  casilla         :string(50)      
#  email           :string(100)     
#  paginaWeb       :string(100)     
#

class InstitucionPeriodistica < ActiveRecord::Base
  set_table_name('dbm_instituciones_periodisticas')
  set_primary_key('idInstituciones')
  
  # Relaciones con otras tablas
  belongs_to :tipo_medio, :foreign_key => 'idTipoMedio'
  belongs_to :departamento_bolivia, :foreign_key => 'idDepartamento'
  
  validates_presence_of :institucion, :message => "No puede estar en blanco"
  
  # Muestra un listado de las instittuciones periodisticas, carga ademas los departamentos y el
  # tipo de medio
  def self.listado(pagina, busqueda)
    busqueda = busqueda.nil? ? '%' : '%' + busqueda + '%'
    self.paginate_by_sql(["SELECT 
      dbm_instituciones_periodisticas.idInstituciones,
      dbm_instituciones_periodisticas.institucion,
      dbm_instituciones_periodisticas.sigla,
      dbm_departamentos_de_bolivia.departamento AS departamento,
      dbm_tipo_de_medio.tipoMedio AS tipo_medio
    FROM
      dbm_instituciones_periodisticas
    INNER JOIN dbm_departamentos_de_bolivia ON (dbm_instituciones_periodisticas.idDepartamento = dbm_departamentos_de_bolivia.idDepartamento)
    INNER JOIN dbm_tipo_de_medio ON (dbm_instituciones_periodisticas.idTipoMedio = dbm_tipo_de_medio.idTipoMedio)
    WHERE dbm_instituciones_periodisticas.institucion LIKE ? ORDER BY dbm_instituciones_periodisticas.institucion", busqueda], :page => pagina, :per_page => 20 )
  end
end
