# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_biblioteca_glosario*
#
#  idGlosario           :integer(11)     not null, primary key
#  idDescriptorGenerico :integer(11)     not null
#  concepto             :string(255)     
#  definicion           :text            
#  
#  Tiene una relacion de un *DescriptorGenerico*: llave foranea => idDescriptorGenerico
#

class Glosario < ActiveRecord::Base
  set_table_name('dbm_biblioteca_glosario')
  set_primary_key('idGlosario')
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  
  # Validacion de los campos que deben de ser llenados obligatoriamente
  # que son concepto
  validates_presence_of :concepto, :definicion, :message => "No puede estar en blanco"
  
  # Realiza una busqueda dentro de los campos antor, titulo y resumen de la 
  # tabla dbm_biblioteca_fichastematicas
  def self.busqueda(pagina=nil, descriptor=nil, busqueda=nil, paginas = 10)
    if descriptor.nil? || descriptor == 'Todos'
      cadena = (busqueda.nil?)? '': "WHERE concepto LIKE '%#{busqueda}%' OR definicion LIKE '%#{busqueda}%'"
    else
      cadena = (busqueda.nil?)? "WHERE dbm_biblioteca_glosario.idDescriptorGenerico = #{descriptor}" : "WHERE dbm_biblioteca_glosario.idDescriptorGenerico = #{descriptor} AND (concepto LIKE '%#{busqueda}%' OR definicion LIKE '%#{busqueda}%')"
    end
    sql = "SELECT 
  dbm_biblioteca_glosario.idGlosario,
  dbm_biblioteca_glosario.concepto,
  dbm_biblioteca_glosario.definicion,
  dbm_descriptor_generico.descriptorGenerico AS descriptor
FROM
  dbm_biblioteca_glosario
  INNER JOIN dbm_descriptor_generico ON (dbm_biblioteca_glosario.idDescriptorGenerico = dbm_descriptor_generico.idDescriptorGenerico) " + cadena
    Documento.paginate_by_sql(sql, :per_page => paginas, :page => pagina)
  end
end
