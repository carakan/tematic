ActionController::Routing::Routes.draw do |map|
  map.resources :mensajes
  map.resources :nota_destacadas
  map.resources :favoritos
  map.resources :foros do |p|
    p.resources :comentarios
  end
  map.resources :primera_manos
  map.resources :multimedias
  map.resources :departamentos
  map.resources :users, :collection => {:forgot_password => :post, :reset_password => :get, :forgot => :get, :change_password => :post }
  
  map.resources :sessions
  # Para la seccion de administracion:
  map.namespace :admin do |admin|
    admin.resources :actors, :has_many=>:posicion_actors
    admin.resources :alcaldes
    admin.resources :asambleistas
    admin.resources :bibliografias
    admin.resources :calendarios
    admin.resources :cargos
    admin.resources :descriptor_especificos
    admin.resources :descriptor_genericos
    admin.resources :documentos
    admin.resources :documento_interes
    admin.resources :departamentos
    admin.resources :especialistas
    admin.resources :enlace_urls
    admin.resources :favoritos
    admin.resources :ficha_tematicas
    admin.resources :glosarios
    admin.resources :imagens
    admin.resources :legislacions
    admin.resources :multimedias
    admin.resources :municipios
    admin.resources :paises
    admin.resources :partido_politicos
    admin.resources :foros, :has_many =>[:comentarios]
    admin.resources :tipo_institucions
    admin.resources :institucions
    admin.resources :institucion_periodisticas, :has_many =>[:periodistas]
    admin.resources :ministerios
    admin.resources :nota_destacadas
    admin.resources :paises
    admin.resources :periodistas
    admin.resources :posicion_actors
    admin.resources :prefectos
    admin.resources :primera_manos
    admin.resources :profesions
    admin.resources :serie_comparativas, :collection => {:busqueda => :get, :btodo => :get}
    admin.resources :serie_cronologicas, :collection => {:busqueda => :get, :btodo => :get}
    admin.resources :tags, :collection =>{:contar =>:get, :buscar=>:get, :guardar_todo=>:get}
    admin.resources :tipo_medios, :has_many =>[:periodistas, :institucion_periodisticas]
    admin.resources :users, :collection => {:buscar => :get, :envio_correos => :get}    
    admin.resources :valor_noticias
  end
  map.connect 'admin', :controller => 'admin/users', :action => 'index'
  map.connect 'login', :controller => 'sessions', :action => 'new'
  map.connect 'logout', :controller => 'sessions', :action => 'destroy'
  map.connect 'activate/:activation_code', :controller => 'users', :action => 'activate'
  map.root :controller => "sitio"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id.html', :format => 'html'
end
