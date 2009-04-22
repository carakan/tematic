# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_biblioteca_documentos*
#
#  idDocumentos         :integer(11)     not null, primary key
#  idDescriptorGenerico :integer(11)     not null
#  tituloMonografia     :string(255)     
#  autorMonografia      :string(255)     
#  tituloAnalitico      :string(255)     
#  autorAnalitico       :string(255)     
#  valorTitular         :string(255)     
#  valorAutor           :string(255)     
#  resumen              :text            default(""), not null
#  archivo              :string(100)     
#
# Direccion de almacenamiento de los documentos es dentro del directorio
# http://bancotematico.org/archivos/documentos/
#

class Documento < ActiveRecord::Base
  set_table_name('dbm_biblioteca_documentos')
  set_primary_key('idDocumentos')
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  
  # Direccion de almacenamiento de los documentos es dentro del directorio
  # http://bancotematico.org/archivos/documentos/
  upload_column :archivo, :store_dir => "archivos/documentos"

  # Valida que tenga un resumen abligatoriamente para una entrada dentro de la 
  # Biblioteca - Documentos  
  validates_presence_of :resumen, :idDescriptorGenerico, :message => "No puede estar en blanco"
  validates_length_of :resumen, :minimum => 20
  
  # Busqueda en la tabla de documntos 
  def self.busqueda(pagina=nil, descriptor=nil, busqueda=nil)
    if descriptor.nil? || descriptor == 'Todos'
      cadena = (busqueda.nil?)? '': "WHERE tituloMonografia LIKE '%#{busqueda}%' OR resumen LIKE '%#{busqueda}%'"
    else
      cadena = (busqueda.nil?)? "WHERE dbm_biblioteca_documentos.idDescriptorGenerico = #{descriptor}" : "WHERE dbm_biblioteca_documentos.idDescriptorGenerico = #{descriptor} AND (tituloMonografia LIKE '%#{busqueda}%' OR resumen LIKE '%#{busqueda}%')"
    end
    sql = "SELECT 
        dbm_biblioteca_documentos.tituloMonografia,
        dbm_biblioteca_documentos.autorMonografia,
        dbm_biblioteca_documentos.tituloAnalitico,
        dbm_biblioteca_documentos.valorTitular,
        dbm_biblioteca_documentos.autorAnalitico,
        dbm_biblioteca_documentos.valorAutor,
        dbm_biblioteca_documentos.resumen,
        dbm_biblioteca_documentos.archivo,
        dbm_descriptor_generico.descriptorGenerico AS descriptor,
        dbm_biblioteca_documentos.idDocumentos
      FROM
        dbm_biblioteca_documentos
      INNER JOIN dbm_descriptor_generico ON (dbm_biblioteca_documentos.idDescriptorGenerico = dbm_descriptor_generico.idDescriptorGenerico) " + cadena
    Documento.paginate_by_sql(sql, :per_page => 10, :page => pagina)
  end
end
