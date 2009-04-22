# == Informacion de la tabla
#
# Nombre de la tabla: *dbm_series_cronologicas*
#
#  idSeriesCronologicas   :integer(11)     not null, primary key
#  idDescriptorGenerico   :integer(11)     not null
#  idDescriptorEspecifico :integer(11)     not null
#  fechaYear              :integer(6)      not null
#  hecho                  :text            default(""), not null
#  contexto               :text            
#  gobierno               :text            
#  fuentes                :text            
#

class SerieCronologica < ActiveRecord::Base
  set_table_name('dbm_series_cronologicas')
  set_primary_key('idSeriesCronologicas')
  
  belongs_to :descriptor_generico, :foreign_key => 'idDescriptorGenerico'
  belongs_to :descriptor_especifico, :foreign_key => 'idDescriptorEspecifico'
  
  validates_numericality_of :fechaYear, :message => "Debe de ser un numero."
  validates_presence_of :hecho, :contexto, :message => "No puede estar en blanco"
  # Muestra un listado de los asambleistas, carga ademas los departamentos y el
  # partido politico
  def self.listado(especifico, pagina, busqueda, inicio =nil, fin = nil)
    busqueda = busqueda.nil? ? '%' : '%' + busqueda + '%'
    
    condiciones = (inicio.nil? || fin.nil? || inicio.to_i.nil? || fin.to_i.nil?) ? '' : " AND fechaYear BETWEEN #{inicio.to_i} AND #{fin.to_i} "
    
    self.paginate_by_sql(["SELECT 
      dbm_series_cronologicas.idSeriesCronologicas,
      dbm_descriptor_generico.descriptorGenerico AS generico,
      dbm_descriptor_especifico.descriptorEspecifico AS especifico,
      dbm_series_cronologicas.fechaYear,
      dbm_series_cronologicas.hecho
    FROM
      dbm_series_cronologicas
      dbm_series_cronologicas
    LEFT OUTER JOIN dbm_descriptor_generico ON (dbm_series_cronologicas.idDescriptorGenerico = dbm_descriptor_generico.idDescriptorGenerico)
    LEFT OUTER JOIN dbm_descriptor_especifico ON (dbm_series_cronologicas.idDescriptorEspecifico = dbm_descriptor_especifico.idDescriptorEspecifico)
    WHERE dbm_series_cronologicas.idDescriptorEspecifico = ? AND dbm_series_cronologicas.hecho LIKE ? " + condiciones + "ORDER BY dbm_series_cronologicas.fechaYear DESC", especifico, busqueda], :page => pagina, :per_page => 7 )
  end
  
  def busqueda(page)
    campo_hecho = self.hecho.blank? ? '%' : '%' + self.hecho + '%'
    campo_contexto = self.contexto.blank? ? '%' : '%' + self.contexto + '%'
    campo_gobierno = self.gobierno.blank? ? '%' : '%' + self.gobierno + '%'
    campo_fuente = self.fuentes.blank? ? '%' : '%' + self.fuentes + '%'
    campo_anio = self.fechaYear.blank? ? '%' : self.fechaYear
    campo_descriptor = self.idDescriptorEspecifico == 0 ? '%' : self.idDescriptorEspecifico
   SerieCronologica.paginate(:per_page => 20, :page => page, :order => 'fechaYear DESC', :conditions => ['idDescriptorEspecifico LIKE ? AND fechaYear LIKE ? AND hecho like ? AND contexto like ? AND gobierno like ? AND fuentes like ?', campo_descriptor, campo_anio, campo_hecho, campo_contexto, campo_gobierno, campo_fuente])
  end
end
