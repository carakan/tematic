# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_descriptor_generico*
#
#  idDescriptorGenerico :integer(11)     not null, primary key
#  descriptorGenerico   :string(100)     default(""), not null
#
# Clase que representa a la tabla dbm_cargo
# Tiene relaciones con las siguientes clases:
class DescriptorGenerico < ActiveRecord::Base
  set_table_name('dbm_descriptor_generico')
  set_primary_key('idDescriptorGenerico')
  
  # Se valida que se registre un Descriptor Generico
  validates_presence_of :descriptorGenerico, :message => "No puede estar en blanco"
  
  # Muestra las opciones para los selects
  def self.seleccion
    self.find(:all).collect { |x| [x.descriptorGenerico, x.idDescriptorGenerico]}
  end
end
