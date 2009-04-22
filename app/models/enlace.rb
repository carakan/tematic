# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_enlaces*
#
#  id         :integer(11)     not null, primary key
#  lactual    :string(255)     
#  lsiguiente :string(255)     
#  tag_id     :integer(11)     
#  created_at :datetime        
#  updated_at :datetime        
#  
# Enlaces que se utilizan para los temas clave 
# 
# *Nota*: Realizado por el pasante
#

class Enlace < ActiveRecord::Base
  set_table_name('dbm_enlaces')
  
  belongs_to :tag, :foreign_key => 'tag_id'
end
