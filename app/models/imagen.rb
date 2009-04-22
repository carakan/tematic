# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_imagens*
#
#  id         :integer(11)     not null, primary key
#  titulo     :string(255)
#  imagen     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  
# Imagenes que se mostraran en la pagina /sitio/imagenes.
#  
# El directorio de almacenamiento es: http://www.bancotematico.org/archivos/imagenes.
#

class Imagen < ActiveRecord::Base
  set_table_name('dbm_imagens')

  image_column :imagen, :store_dir => "imagenes", :root_path => File.join(RAILS_ROOT, 'public/archivos'), :versions => { :thumb => "50x50" }
  validates_presence_of :titulo, :message => "No puede estar en blanco"
end
