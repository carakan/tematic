# == Informacion de la tabla
#
# Nombre de la tabla: *roles*
#
#  id   :integer(11)     not null, primary key
#  name :string(255)     
#  
#  Tabla que se anotan los roles utilizados dentro del sitio
#  
#  Por el momento solamente existe el rol de administrador.
#

class Role < ActiveRecord::Base
  
end
