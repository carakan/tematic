# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_periodistas*
#
#  idPeriodistas        :integer(11)     not null, primary key
#  idInstituciones      :integer(11)     not null
#  idTipoMedio          :integer(11)     not null
#  idDepartamento       :integer(11)     not null
#  idDescriptorGenerico :integer(11)     not null
#  idCargo              :integer(11)     not null
#  nombre               :string(100)     default(""), not null
#  telefono             :string(50)      
#  celular              :string(50)      
#  perfil               :text            
#  profesion            :text            
#  direccion            :text            
#  email                :string(100)     
#

class Periodista < ActiveRecord::Base
  set_table_name('dbm_periodistas')
  set_primary_key('idPeriodistas')
  
  belongs_to :cargo, :foreign_key => 'idCargo'
  belongs_to :institucion, :class_name => 'InstitucionPeriodistica', :foreign_key => 'idInstitucion'
  belongs_to :tipo_medio, :foreign_key => 'idTipoMedio'
  belongs_to :departamento, :class_name => 'DepartamentoBolivia', :foreign_key => 'idDepartamento'
  
  validates_presence_of :nombre, :message => "No puede estar en blanco"
  
  # Muestra un listado de los asambleistas, carga ademas los departamentos y el
  # partido politico
  def self.listado(pagina, busqueda, departamento = nil, tipo = nil, institucion = nil)
    if tipo.nil?
      cadena = (departamento.nil? || departamento == 'Todos')?'':" AND dbm_periodistas.idDepartamento = #{departamento} "
    else
      cadena = " AND dbm_periodistas.idTipoMedio = #{tipo} "
    end
    cadena += institucion.nil? ? '': " AND dbm_periodistas.idInstituciones = #{institucion} "
    busqueda = busqueda.nil? ? '%' : '%' + busqueda + '%'
    self.paginate_by_sql(["SELECT 
      dbm_periodistas.idTipoMedio,
      dbm_periodistas.idPeriodistas,
      dbm_periodistas.nombre,
      dbm_periodistas.telefono,
      dbm_periodistas.email,
      dbm_instituciones_periodisticas.institucion AS nom_institucion,
      dbm_departamentos_de_bolivia.departamento AS nom_departamento,
      dbm_tipo_de_medio.tipoMedio AS nom_medio,
      dbm_cargo.cargo AS nom_cargo
    FROM
      dbm_periodistas
    LEFT OUTER JOIN dbm_instituciones_periodisticas ON (dbm_periodistas.idInstituciones = dbm_instituciones_periodisticas.idInstituciones)
    LEFT OUTER JOIN dbm_departamentos_de_bolivia ON (dbm_periodistas.idDepartamento = dbm_departamentos_de_bolivia.idDepartamento)
    LEFT OUTER JOIN dbm_tipo_de_medio ON (dbm_periodistas.idTipoMedio = dbm_tipo_de_medio.idTipoMedio)
    LEFT OUTER JOIN dbm_cargo ON (dbm_periodistas.idCargo = dbm_cargo.idCargo)
    WHERE dbm_periodistas.nombre LIKE ? " + cadena + "ORDER BY dbm_periodistas.nombre", busqueda], :page => pagina, :per_page => 20 )
  end
end
