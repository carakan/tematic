xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  xml.channel do
    xml.title 'Listado de notas destacadas de periodistas - Banco Temático'
    xml.description 'Listado de articulos de interes general dentro de los registros del Banco Temático escritos por periodistas'
    xml.link formatted_nota_destacadas_url(:rss)
    for primera_mano in @nota_destacadas
      xml.item do
        xml.title primera_mano.titulo
        xml.description primera_mano.resumen
        xml.image do
          xml.url primera_mano.imagen
        end
        xml.pubDate primera_mano.created_at
        xml.link nota_destacada_url(primera_mano)
      end
    end
  end
end