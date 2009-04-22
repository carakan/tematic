# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_biblioteca_fichastematicas*
#
#  idFichasTematicas    :integer(11)     not null, primary key
#  idDescriptorGenerico :integer(11)     not null
#  idPais               :integer(11)     not null
#  autor                :string(255)     default(""), not null
#  resumen              :text            default(""), not null
#  pagina               :string(100)     
#  titulo               :string(255)     
#  editorial            :string(100)     
#  lugar                :string(100)     
#  fechaYear            :integer(6)      
#

class FichaTematica < ActiveRecord::Base
  set_table_name('dbm_biblioteca_fichastematicas')
  set_primary_key('idFichasTematicas')
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  belongs_to :paise, :foreign_key => 'idPais'
  
  # Valida que tenga un autor, resumen abligatoriamente para una entrada dentro de la seccion
  # *Biblioteca - Ficha Tematica* 
  validates_presence_of :idDescriptorGenerico, :idPais, :autor, :resumen, :message => "No puede estar en blanco"
  
  # Realiza una busqueda dentro de los campos antor, titulo y resumen de la 
  # tabla dbm_biblioteca_fichastematicas
  def self.busqueda(pagina=nil, descriptor=nil, busqueda=nil)
    if descriptor.nil? || descriptor == 'Todos'
      cadena = (busqueda.nil?)? '': "WHERE titulo LIKE '%#{busqueda}%' OR resumen LIKE '%#{busqueda}%' OR autor LIKE '%#{busqueda}%'"
    else
      cadena = (busqueda.nil?)? "WHERE dbm_biblioteca_fichastematicas.idDescriptorGenerico = #{descriptor}" : "WHERE dbm_biblioteca_fichastematicas.idDescriptorGenerico = #{descriptor} AND (titulo LIKE '%#{busqueda}%' OR resumen LIKE '%#{busqueda}%' OR autor LIKE '%#{busqueda}%')"
    end
    sql = "SELECT 
  dbm_descriptor_generico.descriptorGenerico AS descriptor,
  dbm_biblioteca_fichastematicas.idFichasTematicas,
  dbm_biblioteca_fichastematicas.autor,
  dbm_biblioteca_fichastematicas.resumen,
  dbm_biblioteca_fichastematicas.pagina,
  dbm_biblioteca_fichastematicas.titulo,
  dbm_biblioteca_fichastematicas.editorial,
  dbm_biblioteca_fichastematicas.lugar,
  dbm_biblioteca_fichastematicas.fechaYear,  
  dbm_biblioteca_fichastematicas.idPais
FROM
  dbm_biblioteca_fichastematicas
  INNER JOIN dbm_descriptor_generico ON (dbm_biblioteca_fichastematicas.idDescriptorGenerico = dbm_descriptor_generico.idDescriptorGenerico) " + cadena
    Documento.paginate_by_sql(sql, :per_page => 10, :page => pagina)
  end
end
