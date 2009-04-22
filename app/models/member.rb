# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_secure_members*
#
#  id               :integer(10)     not null, primary key
#  login_smember    :string(25)      default(""), not null
#  pass_smember     :string(25)      default(""), not null
#  name_smember     :string(50)      default(""), not null
#  lastname_smember :string(50)      default(""), not null
#  dateReg_smember  :timestamp       not null
#  id_sprofesion    :integer(5)      not null
#  email_smember    :string(125)     default(""), not null
#  numero_visitas   :integer(11)     default(0)
#
# Newsesario para la migracion de datos a la nueva tabla User
# 
# En el nuevo sistema no se utiliza.
#

class Member < ActiveRecord::Base
  set_table_name('dbm_secure_members')
end
