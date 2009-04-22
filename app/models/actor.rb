# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_actores*
#
#  Id_Actor   :integer(11)     not null, primary key
#  nombre     :string(100)     
#  urlArchivo :string(255)     
#
# Clase que representa a un actor dentro del Banco Tematico
# Direccion de almacenamiento de las imagenes en dentro del directorio
# http://bancotematico.org/archivos/imgMapaActores/
# Tamaño de la imagen es de 128x128
# 
# Tiene una relacion de muchas *PosicionActor* :llave foranea Id_actor

class Actor < ActiveRecord::Base
  set_table_name('dbm_actores')
  set_primary_key('Id_Actor')
  
  has_many :posicion_actors, :foreign_key => 'Id_Actor'
  # direccion de almacenamiento de las imagenes en dentro del directorio
  # http://bancotematico.org/archivos/imgMapaActores/
  image_column :urlArchivo, :store_dir => "imgMapaActores", :root_path => File.join(RAILS_ROOT, 'public/archivos')
  
  # Validaciones dentro de la tabla
  # Siempre tiene que tener un nombre no puede estar vacio el campo
  validates_presence_of :nombre, :message => "No puede estar en blanco"
  # Metodo que redimenciona el tamaño de la imagen que se a subido
  def after_save
    #self.urlArchivo.resize!('128x128')
  end
end
