# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_documentos_de_interes*
#
#  idDocumentosInteres :integer(11)     not null, primary key
#  titulo              :string(255)     default(""), not null
#  idDocumentos        :integer(11)     not null
#
# Se asocia un Documento con una entrada a documentos de interes
# Esta se vera dentro de la pagina inicial del sitio en la seccion Documentos de interes
class DocumentoIntere < ActiveRecord::Base
  set_table_name('dbm_documentos_de_interes')
  set_primary_key('idDocumentosInteres')
  
  validates_presence_of :titulo, :message => "No puede estar en blanco"
  belongs_to :documento, :foreign_key => 'idDocumentos'
end
