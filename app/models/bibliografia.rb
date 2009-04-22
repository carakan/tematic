# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_biblioteca_bibliografia*
#
#  idBibliografia       :integer(11)     not null, primary key
#  idDescriptorGenerico :integer(11)     not null
#  autor                :string(255)     default(""), not null
#  titulo               :string(255)     default(""), not null
#  lugar                :string(100)     
#  editorial            :string(100)     
#  pagina               :string(100)     
#  fechaYear            :integer(6)      
#  enlaceWeb            :string(100)     
#
# Clase que representa a la tabla dbm_biblioteca_bibliografia
# Tiene relaciones con las siguientes clases:
# 
# *DescriptorGenerico* idDescriptorGenerico
class Bibliografia < ActiveRecord::Base
  set_table_name('dbm_biblioteca_bibliografia')
  set_primary_key('idBibliografia')
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  
  # Se valida que se registre un autor y su titulo en una entrada en bibliografia
  validates_presence_of :autor, :titulo, :message => "No puede estar en blanco"
  
  # Realiza una busqueda dentro de los campos antor, titulo y editorial de la 
  # tabla dbm_biblioteca_bibliografias
  def self.busqueda(pagina=nil, descriptor=nil, busqueda=nil, numero_paginas = 10)
    if descriptor.nil? || descriptor == 'Todos'
      cadena = (busqueda.nil?)? '': "WHERE titulo LIKE '%#{busqueda}%' OR editorial LIKE '%#{busqueda}%' OR autor LIKE '%#{busqueda}%'"
    else
      cadena = (busqueda.nil?)? "WHERE dbm_biblioteca_bibliografia.idDescriptorGenerico = #{descriptor}" : "WHERE dbm_biblioteca_bibliografia.idDescriptorGenerico = #{descriptor} AND (titulo LIKE '%#{busqueda}%' OR editorial LIKE '%#{busqueda}%' OR autor LIKE '%#{busqueda}%')"
    end
    sql = "SELECT 
      dbm_descriptor_generico.descriptorGenerico AS descriptor,
  dbm_biblioteca_bibliografia.idBibliografia,
  dbm_biblioteca_bibliografia.autor,
  dbm_biblioteca_bibliografia.titulo,
  dbm_biblioteca_bibliografia.lugar,
  dbm_biblioteca_bibliografia.editorial,
  dbm_biblioteca_bibliografia.pagina,
  dbm_biblioteca_bibliografia.fechaYear,
  dbm_biblioteca_bibliografia.enlaceWeb
FROM
  dbm_biblioteca_bibliografia
  INNER JOIN dbm_descriptor_generico ON (dbm_biblioteca_bibliografia.idDescriptorGenerico = dbm_descriptor_generico.idDescriptorGenerico) " + cadena
    Documento.paginate_by_sql(sql, :per_page => numero_paginas, :page => pagina)
  end
end
