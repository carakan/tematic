# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_nota_destacadas*
#
#  id         :integer(11)     not null, primary key
#  titulo     :string(255)
#  resumen    :text
#  fuente     :string(255)
#  archivo    :string(255)
#  enlace     :string(255)
#  imagen     :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Direccion de almacenamiento de las imagenes esta dentro del directorio
# http://www.bancotematico.org/archivos/notaDestacada/imagen
#
# Direccion de almacenamiento de los documentos esta dentro del directorio
# http://www.bancotematico.org/archivos/notaDestacada/archivos
#
class NotaDestacada < ActiveRecord::Base
  set_table_name('dbm_nota_destacadas')
  
  # direccion de almacenamiento de las imagenes en dentro del directorio
  # /archivos/notaDestacada/imagen
  image_column :imagen, :store_dir => "notaDestacada/imagen", :root_path => File.join(RAILS_ROOT, 'public/archivos')
  # direccion de almacenamiento de las imagenes en dentro del directorio
  # /archivos/notaDestacada/archivos
  upload_column :archivo, :store_dir => "archivos/notaDestacada/archivos"
  
  validates_presence_of :titulo
end
