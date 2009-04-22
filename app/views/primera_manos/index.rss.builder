xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  xml.channel do
    xml.title 'Listado de articulos en primera mano - Banco Temático'
    xml.description 'Listado de articulos de interes general dentro de los registros del Banco Temático'
    xml.link formatted_primera_manos_url(:rss)
    for primera_mano in @primera_manos
      xml.item do
        xml.title primera_mano.titular
        xml.description primera_mano.presentacion
        xml.image do
          xml.url primera_mano.imagen
        end
        xml.pubDate primera_mano.fecha
        xml.link primera_mano_url(primera_mano)
      end
    end
  end
end