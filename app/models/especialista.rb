# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_especialistas*
#
#  idEspecialistas      :integer(11)     not null, primary key
#  idDescriptorGenerico :integer(11)     not null
#  nombre               :string(100)     default(""), not null
#  telefono             :string(50)      
#  celular              :string(50)      
#  perfil               :text            
#  publicacion          :text            
#  profesion            :text            
#  especialidad         :text            
#  lugar                :string(100)     
#  email                :string(100)     
#  paginaWeb            :string(100)     
#

class Especialista < ActiveRecord::Base
  set_table_name('dbm_especialistas')
  set_primary_key('idEspecialistas')
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  
  # Se valida que se rellene un nombre y que tenga una relacion con algun descriptor generico
  validates_presence_of :nombre, :idDescriptorGenerico, :message => "No puede estar en blanco"
end
