# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_biblioteca_legislacion*
#
#  idLegislacion        :integer(11)     not null, primary key
#  idDescriptorGenerico :integer(11)     not null
#  descripcion          :string(255)     default(""), not null
#  contenido            :text            default(""), not null
#  archivo              :string(100)     
#

class Legislacion < ActiveRecord::Base
  set_table_name('dbm_biblioteca_legislacion')
  set_primary_key('idLegislacion')
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  upload_column :archivo, :store_dir => "archivos/legislacion"
  
  validates_presence_of :descripcion, :message => "No puede estar en blanco"
  
  # Realiza una busqueda dentro de los campos antor, titulo y resumen de la 
  # tabla dbm_biblioteca_fichastematicas
  def self.busqueda(pagina=nil, descriptor=nil, busqueda=nil, paginas = 10)
    if descriptor.nil? || descriptor == 'Todos'
      cadena = (busqueda.nil?)? '': "WHERE descripcion LIKE '%#{busqueda}%' OR contenido LIKE '%#{busqueda}%'"
    else
      cadena = (busqueda.nil?)? "WHERE dbm_biblioteca_legislacion.idDescriptorGenerico = #{descriptor}" : "WHERE dbm_biblioteca_legislacion.idDescriptorGenerico = #{descriptor} AND (descripcion LIKE '%#{busqueda}%' OR contenido LIKE '%#{busqueda}%')"
    end
    sql = "SELECT 
  dbm_biblioteca_legislacion.idLegislacion,
  dbm_biblioteca_legislacion.descripcion,
  dbm_biblioteca_legislacion.contenido,
  dbm_biblioteca_legislacion.archivo,
  dbm_descriptor_generico.descriptorGenerico AS descriptor
FROM
  dbm_biblioteca_legislacion
  INNER JOIN dbm_descriptor_generico ON (dbm_biblioteca_legislacion.idDescriptorGenerico = dbm_descriptor_generico.idDescriptorGenerico) " + cadena
    Documento.paginate_by_sql(sql, :per_page => paginas, :page => pagina)
  end
end
