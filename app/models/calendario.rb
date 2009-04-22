# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_calendario*
#
#  idCalendario :integer(11)     not null, primary key
#  fecha        :date            not null
#  tipo         :string(50)      default(""), not null
#  titulo       :string(255)     
#  resumen      :text            
#  lugar        :string(100)     
#  paginaWeb    :string(100)     
#  email        :string(100)     
#
# Clase que representa a la tabla dbm_calendario
# 
# No tiene relaciones con ninguna tabla.
# 
# Se valida que se registre una fecha, tipo y un titulo dentro del calendario
class Calendario < ActiveRecord::Base
  set_table_name('dbm_calendario')
  set_primary_key('idCalendario')
  
  # Se valida que se registre una fecha, tipo y un titulo dentro del calendario
  validates_presence_of :fecha, :titulo, :tipo, :message => "No puede estar en blanco"
end
