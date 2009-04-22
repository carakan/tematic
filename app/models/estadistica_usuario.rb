# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_estadistica_usuarios*
#
#  id      :integer(11)     not null, primary key
#  user_id :integer(11)
#  total   :integer(11)
#  fecha   :date
#  
# Tabla en la que se anotan los usuarios que visitaron en la *fecha* de medicion
# a partir de los datos anotados se elaboran las estadisticas de ingreso de usuarios.
# 
# Relaciones: 
# 
# Tiene asociado un User por la llave foranea *user_id*
# 
# *Importante*: se ha creado un proceso automatico de recoleccion de datos, estos se realizan cada lunes 
# en la madrugada.
#

class EstadisticaUsuario < ActiveRecord::Base
  set_table_name('dbm_estadistica_usuarios')
  
  belongs_to :user
  
  # Consulta que devuelve de acuerdo a una fecha dada, el numero de visitas por profesiones 
  # es un funcion estatica
  # 
  def self.contador_profesiones(fecha)
    sql = ["SELECT 
      dbm_profesiones.Profesion AS profesionn,
      COUNT(dbm_estadistica_usuarios.id) AS contador
    FROM
      users
      LEFT OUTER JOIN dbm_estadistica_usuarios ON (users.id = dbm_estadistica_usuarios.user_id)
      LEFT OUTER JOIN dbm_profesiones ON (users.profesion_id = dbm_profesiones.idProfesion)
    WHERE
      dbm_estadistica_usuarios.fecha = ?
    GROUP BY
      dbm_profesiones.Profesion", fecha]
    self.find_by_sql sql 
  end
end
