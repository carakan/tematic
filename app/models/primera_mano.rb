# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_primeramano*
#
#  idPrimeraMano :integer(11)     not null, primary key
#  titular       :string(255)     default(""), not null
#  imagen        :string(100)     
#  presentacion  :text            default(""), not null
#  fecha         :date            not null
#  fuentes       :string(255)     
#  archivo1      :string(100)     
#  archivo2      :string(100)     
#  slug          :string(255)     
#
# Clase que representa a una noticia en primera mano dentro del Banco Tematico
# Direccion de almacenamiento de las imagenes en dentro del directorio
# http://bancotematico.org/archivos/primeraMano/imagen/
# 
# Tamaño de la imagen es de 100x70
# Ademas se asocia hasta dos archivos adjuntos, el primero se llama archivo1 y el segundo archivo2
# estos dos posibles archivos subidos se almacenan dentro del directorio:
# http://bancotematico.org/archivos/primeraMano/archivos/
class PrimeraMano < ActiveRecord::Base
  set_table_name('dbm_primeramano')
  set_primary_key('idPrimeraMano')
  # direccion de almacenamiento de las imagenes en dentro del directorio
  # /archivos/primeraMano/imagen
  image_column :imagen, :store_dir => "primeraMano/imagen", :root_path => File.join(RAILS_ROOT, 'public/archivos')
  # direccion de almacenamiento de las imagenes en dentro del directorio
  # /archivos/primeraMano/archivos
  upload_column :archivo1, :store_dir => "archivos/primeraMano/archivos"
  upload_column :archivo2, :store_dir => "archivos/primeraMano/archivos"
  
  validates_presence_of :titular, :presentacion, :fecha, :message => "No puede estar en blanco"
  
  # Tamaño de la imagen es de 100x70
  def after_save
  #  self.imagen.resize!('100x70')
  end
end
