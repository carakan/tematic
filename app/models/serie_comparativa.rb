# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_series_comparativas*
#
#  idSeriesComparativas   :integer(11)     not null, primary key
#  idPais                 :integer(11)     not null
#  idDescriptorGenerico   :integer(11)     not null
#  idDescriptorEspecifico :integer(11)     not null
#  hecho                  :text            default(""), not null
#  contexto               :text            
#  gobierno               :text            
#  fuentes                :text            
#  paginaWeb              :string(100)     
#

class SerieComparativa < ActiveRecord::Base
  set_table_name('dbm_series_comparativas')
  set_primary_key('idSeriesComparativas')
  
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  belongs_to :descriptor_especifico, :foreign_key => 'idDescriptorEspecifico'
  belongs_to :paise, :foreign_key => 'idPais'
  
  validates_presence_of :hecho, :contexto, :message => "No puede estar en blanco"
  
  # Muestra un listado de los asambleistas, carga ademas los departamentos y el
  # partido politico
  def self.listado(especifico, pagina, busqueda)
    busqueda = busqueda.nil? ? '%' : '%' + busqueda + '%'
    self.paginate_by_sql(["SELECT 
      dbm_series_comparativas.idSeriesComparativas,
      dbm_series_comparativas.hecho,
      dbm_descriptor_generico.descriptorGenerico AS generico,
      dbm_descriptor_especifico.descriptorEspecifico AS especifico,
      dbm_paises.pais as pais
    FROM
      dbm_series_comparativas
    INNER JOIN dbm_paises ON (dbm_series_comparativas.idPais = dbm_paises.idPais)
    INNER JOIN dbm_descriptor_generico ON (dbm_series_comparativas.idDescriptorGenerico = dbm_descriptor_generico.idDescriptorGenerico)
    INNER JOIN dbm_descriptor_especifico ON (dbm_series_comparativas.idDescriptorEspecifico = dbm_descriptor_especifico.idDescriptorEspecifico)
    WHERE dbm_series_comparativas.idDescriptorEspecifico = ? AND dbm_series_comparativas.hecho LIKE ? ORDER BY dbm_paises.pais", especifico, busqueda], :page => pagina, :per_page => 7 )
  end
  
  def busqueda(page)
    campo_pais = self.idPais == 0 ? '%' : self.idPais
    campo_hecho = self.hecho.blank? ? '%' : '%' + self.hecho + '%'
    campo_contexto = self.contexto.blank? ? '%' : '%' + self.contexto + '%'
    campo_gobierno = self.gobierno.blank? ? '%' : '%' + self.gobierno + '%'
    campo_fuente = self.fuentes.blank? ? '%' : '%' + self.fuentes + '%'
    campo_descriptor = self.idDescriptorEspecifico == 0 ? '%' : self.idDescriptorEspecifico
    SerieComparativa.paginate(:per_page => 20, :page => page, :conditions => ['idDescriptorEspecifico LIKE ? AND idPais LIKE ? AND hecho like ? AND contexto like ? AND gobierno like ? AND fuentes like ?', campo_descriptor, campo_pais, campo_hecho, campo_contexto, campo_gobierno, campo_fuente])
  end
end
