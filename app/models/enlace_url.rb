# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_enlace_urls*
#
#  id          :integer(11)     not null, primary key
#  nombre      :string(255)
#  descripcion :string(255)
#  url         :string(255)
#  orden       :integer(11)
#  created_at  :datetime
#  updated_at  :datetime
#  imagen      :string(255)
#  mostrar     :boolean(1)
#  
# Enlaces que se mostraran en la pagina principal y la pagina /sitio/enlaces
#
# Ademas puede o no asociarce una imagen al enlace.
# 
# En el campo mostrar se le indica si se muestra en la pagina principal del sitio este enlace.
#
  
class EnlaceUrl < ActiveRecord::Base
  set_table_name('dbm_enlace_urls')
  
  validates_presence_of :nombre, :descripcion, :url, :message => "No puede estar en blanco" 
  
  image_column :imagen, :store_dir => "enlaces", :root_path => File.join(RAILS_ROOT, 'public/archivos')
end
