# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_descriptor_especifico*
#
#  idDescriptorEspecifico :integer(11)     not null, primary key
#  idDescriptorGenerico   :integer(11)     not null
#  descriptorEspecifico   :string(100)     default(""), not null
#
# Se valida que se registre un Descriptor Especifico y su relacion con 
# una entrada dentro de la tabla de los *DescriptorGenerico*
# Tiene relaciones con las siguientes clases:
class DescriptorEspecifico < ActiveRecord::Base
  set_table_name('dbm_descriptor_especifico')
  set_primary_key('idDescriptorEspecifico')
  belongs_to :descriptor_generico, :foreign_key => :idDescriptorGenerico
  
  # Se valida que se registre un Descriptor Especifico y su relacion con 
  # una entrada dentro de la tabla de los *Descriptor Generico*
  validates_presence_of :descriptorEspecifico, :idDescriptorGenerico, :message => "No puede estar en blanco"
end
