# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_tags*
#
#  id          :integer(11)     not null, primary key
#  descripcion :string(255)
#  ocurrencias :integer(11)     default(0)
#  enlazados   :integer(11)     default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

class Tag < ActiveRecord::Base
  set_table_name('dbm_tags')
  
  #has_many :los_enlaces, :class_name=>'enlaces', :dependent=>:destroy
  has_many :enlaces, :dependent => :destroy
  validates_uniqueness_of :descripcion
end
