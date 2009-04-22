# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_multimedia*
#
#  idMultimedia :integer(11)     not null, primary key
#  titulo       :string(255)     default(""), not null
#  archivo      :string(100)     default(""), not null
#  created      :datetime        
#
# Tabla que representa a un elemento multimedia, estos elementos se almacenan en el directorio
# http://bancotematico.org/archivos/multimedia/archivo
class Multimedia < ActiveRecord::Base
  set_table_name('dbm_multimedia')
  set_primary_key('idMultimedia')
  
  upload_column :archivo, :store_dir => "archivos/multimedia"
end
