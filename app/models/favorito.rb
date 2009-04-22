# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_secure_favorites*
#
#  idFavoritos :integer(11)     not null, primary key
#  id          :integer(11)     not null
#  titulo      :string(100)     
#  enlace      :string(255)     default(""), not null
#
# Representa a una pagina que el usuario guarde como su favorito.
#
class Favorito < ActiveRecord::Base
  set_table_name('dbm_secure_favorites')
  set_primary_key('idFavoritos')
end
