# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_biblioteca_valornoticia*
#
#  idValorNoticia       :integer(11)     not null, primary key
#  idDescriptorGenerico :integer(11)     not null
#  imagen               :string(100)     
#  titulo               :string(255)     default(""), not null
#  autor                :string(255)     default(""), not null
#  descripcion          :text            default(""), not null
#  archivo              :string(100)     
#
# Clase que representa a una entrada en la seccion *valor-noticia* dentro del Banco Tematico
# Cada registro dentro de la tabla Valor Noticia se tiene que anezar una imagen y un archivo adjunto
# Direccion de almacenamiento del archivo adjunto es dentro del sirectorio
# http://bancotematico.org/archivos/valorNoticia/archivos
# 
# Direccion de almacenamiento de las imagenes en dentro del directorio
# http://bancotematico.org/archivos/valorNoticia/imagen
#
class ValorNoticia < ActiveRecord::Base
  set_table_name('dbm_biblioteca_valornoticia')
  set_primary_key('idValorNoticia')
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  # Cada registro dentro de la tabla Valor Noticia se tiene que anezar una imagen y un archivo adjunto
  # Direccion de almacenamiento del archivo adjunto es dentro del sirectorio
  # http://bancotematico.org/archivos/valorNoticia/archivos
  upload_column :archivo, :store_dir => "archivos/valorNoticia/archivos"
  # Direccion de almacenamiento de las imagenes en dentro del directorio
  # http://bancotematico.org/archivos/valorNoticia/imagen
  image_column :imagen, :store_dir => "valorNoticia/imagen", :root_path => File.join(RAILS_ROOT, 'public/archivos')
  
  validates_presence_of :titulo, :autor, :message => "No puede estar en blanco"
  
  # Tamaño de la imagen es de 70x60
  def after_save
    #self.imagen.resize!('70x60')
  end
  
  # Realiza una busqueda dentro de los campos antor, titulo y resumen de la 
  # tabla dbm_biblioteca_fichastematicas
  def self.busqueda(pagina=nil, descriptor=nil, busqueda=nil, paginas = 10)
    if descriptor.nil? || descriptor == 'Todos'
      cadena = (busqueda.nil?)? '': "WHERE titulo LIKE '%#{busqueda}%' OR autor LIKE '%#{busqueda}%' OR descripcion LIKE '%#{busqueda}%'"
    else
      cadena = (busqueda.nil?)? "WHERE dbm_biblioteca_valornoticia.idDescriptorGenerico = #{descriptor}" : "WHERE dbm_biblioteca_valornoticia.idDescriptorGenerico = #{descriptor} AND (titulo LIKE '%#{busqueda}%' OR autor LIKE '%#{busqueda}%' OR descripcion LIKE '%#{busqueda}%')"
    end
    sql = "SELECT 
      dbm_biblioteca_valornoticia.idValorNoticia,
      dbm_biblioteca_valornoticia.imagen,
      dbm_biblioteca_valornoticia.titulo,
      dbm_biblioteca_valornoticia.autor,
      dbm_biblioteca_valornoticia.descripcion,
      dbm_biblioteca_valornoticia.archivo,
      dbm_descriptor_generico.descriptorGenerico AS descriptor
    FROM
      dbm_biblioteca_valornoticia
    INNER JOIN dbm_descriptor_generico ON (dbm_biblioteca_valornoticia.idDescriptorGenerico = dbm_descriptor_generico.idDescriptorGenerico) " + cadena
    Documento.paginate_by_sql(sql, :per_page => paginas, :page => pagina)
  end
end
