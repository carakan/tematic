# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_bolivia_en_cifras*
#
#  idBoliviaEnCifras :integer(11)     not null, primary key
#  imagen            :string(100)
#  departamento      :string(50)      default(""), not null
#  fundacion         :string(255)     default(""), not null
#  aniversarioCivico :string(255)     default(""), not null
#  altitud           :string(255)     default(""), not null
#  poblacion         :string(100)     default(""), not null
#  superficie        :string(255)     default(""), not null
#  capital           :string(255)     default(""), not null
#  poblacionCapital  :string(100)     default(""), not null
#
# Tabla que muestra las caracteristicas para mostrar 
# en las paginas bolivia en cifras
#
# Tiene relaciones con las siguientes clases:

class Departamento < ActiveRecord::Base
  set_table_name('dbm_bolivia_en_cifras')
  set_primary_key('idBoliviaEnCifras')
  validates_presence_of :departamento
  image_column :imagen, :store_dir => "boliviaEnCifras", :root_path => File.join(RAILS_ROOT, 'public/archivos')
  
  validates_presence_of :departamento, :fundacion, :aniversarioCivico, :altitud, :poblacion, :superficie, :capital , :message => "No puede estar en blanco"
end
