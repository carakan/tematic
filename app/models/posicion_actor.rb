# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_posicion_actor*
#
#  Id_PosicionActor      :integer(11)     not null, primary key
#  Id_Actor              :integer(11)     not null
#  fecha                 :date            not null
#  titular               :text            default(""), not null
#  posicion              :text            default(""), not null
#  fuente                :text            default(""), not null
#  Id_Descrip_Generico   :integer(11)     not null
#  Id_Descrip_Especifico :integer(11)     not null
#

class PosicionActor < ActiveRecord::Base
  set_table_name('dbm_posicion_actor')
  set_primary_key('Id_PosicionActor')
end
