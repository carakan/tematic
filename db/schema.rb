# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 25) do

  create_table "dbm_actores", :primary_key => "Id_Actor", :force => true do |t|
    t.string "nombre",     :limit => 100
    t.string "urlArchivo"
  end

  create_table "dbm_alcaldes", :id => false, :force => true do |t|
    t.integer "idAlcaldes",                                       :null => false
    t.integer "idDepartamento",                                   :null => false
    t.integer "idMunicipio",                                      :null => false
    t.integer "idPartidoPolitico",                                :null => false
    t.string  "nombre",            :limit => 100, :default => "", :null => false
    t.string  "telefono",          :limit => 50
    t.string  "celular",           :limit => 50
    t.string  "email",             :limit => 100
    t.string  "paginaWeb",         :limit => 100
  end

  add_index "dbm_alcaldes", ["idPartidoPolitico"], :name => "idPartidoPolitico"
  add_index "dbm_alcaldes", ["idMunicipio", "idDepartamento"], :name => "idMunicipio"

  create_table "dbm_asambleistas", :id => false, :force => true do |t|
    t.integer "idAsambleistas",                                   :null => false
    t.integer "idDepartamento",                                   :null => false
    t.integer "idPartidoPolitico",                                :null => false
    t.string  "nombre",            :limit => 100, :default => "", :null => false
    t.string  "telefono",          :limit => 50
    t.string  "celular",           :limit => 50
    t.string  "email",             :limit => 100
  end

  add_index "dbm_asambleistas", ["idPartidoPolitico"], :name => "idPartidoPolitico"
  add_index "dbm_asambleistas", ["idDepartamento"], :name => "idDepartamento"

  create_table "dbm_biblioteca_bibliografia", :id => false, :force => true do |t|
    t.integer "idBibliografia",                                      :null => false
    t.integer "idDescriptorGenerico",                                :null => false
    t.string  "autor",                               :default => "", :null => false
    t.string  "titulo",                              :default => "", :null => false
    t.string  "lugar",                :limit => 100
    t.string  "editorial",            :limit => 100
    t.string  "pagina",               :limit => 100
    t.integer "fechaYear",            :limit => 6
    t.string  "enlaceWeb",            :limit => 100
  end

  add_index "dbm_biblioteca_bibliografia", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"

  create_table "dbm_biblioteca_documentos", :id => false, :force => true do |t|
    t.integer "idDocumentos",                                        :null => false
    t.integer "idDescriptorGenerico",                                :null => false
    t.string  "tituloMonografia"
    t.string  "autorMonografia"
    t.string  "tituloAnalitico"
    t.string  "autorAnalitico"
    t.string  "valorTitular"
    t.string  "valorAutor"
    t.text    "resumen",                             :default => "", :null => false
    t.string  "archivo",              :limit => 100
  end

  add_index "dbm_biblioteca_documentos", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"

  create_table "dbm_biblioteca_fichastematicas", :id => false, :force => true do |t|
    t.integer "idFichasTematicas",                                   :null => false
    t.integer "idDescriptorGenerico",                                :null => false
    t.integer "idPais",                                              :null => false
    t.string  "autor",                               :default => "", :null => false
    t.text    "resumen",                             :default => "", :null => false
    t.string  "pagina",               :limit => 100
    t.string  "titulo"
    t.string  "editorial",            :limit => 100
    t.string  "lugar",                :limit => 100
    t.integer "fechaYear",            :limit => 6
  end

  add_index "dbm_biblioteca_fichastematicas", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"
  add_index "dbm_biblioteca_fichastematicas", ["idPais"], :name => "idPais"

  create_table "dbm_biblioteca_glosario", :id => false, :force => true do |t|
    t.integer "idGlosario",           :null => false
    t.integer "idDescriptorGenerico", :null => false
    t.string  "concepto"
    t.text    "definicion"
  end

  add_index "dbm_biblioteca_glosario", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"

  create_table "dbm_biblioteca_legislacion", :id => false, :force => true do |t|
    t.integer "idLegislacion",                                       :null => false
    t.integer "idDescriptorGenerico",                                :null => false
    t.string  "descripcion",                         :default => "", :null => false
    t.text    "contenido",                           :default => "", :null => false
    t.string  "archivo",              :limit => 100
  end

  add_index "dbm_biblioteca_legislacion", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"

  create_table "dbm_biblioteca_valornoticia", :id => false, :force => true do |t|
    t.integer "idValorNoticia",                                      :null => false
    t.integer "idDescriptorGenerico",                                :null => false
    t.string  "imagen",               :limit => 100
    t.string  "titulo",                              :default => "", :null => false
    t.string  "autor",                               :default => "", :null => false
    t.text    "descripcion",                         :default => "", :null => false
    t.string  "archivo",              :limit => 100
  end

  add_index "dbm_biblioteca_valornoticia", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"

  create_table "dbm_bolivia_en_cifras", :primary_key => "idBoliviaEnCifras", :force => true do |t|
    t.string "imagen",            :limit => 100
    t.string "departamento",      :limit => 50,  :default => "", :null => false
    t.string "fundacion",                        :default => "", :null => false
    t.string "aniversarioCivico",                :default => "", :null => false
    t.string "altitud",                          :default => "", :null => false
    t.string "poblacion",         :limit => 100, :default => "", :null => false
    t.string "superficie",                       :default => "", :null => false
    t.string "capital",                          :default => "", :null => false
    t.string "poblacionCapital",  :limit => 100, :default => "", :null => false
  end

  create_table "dbm_calendario", :primary_key => "idCalendario", :force => true do |t|
    t.date   "fecha",                                    :null => false
    t.string "tipo",      :limit => 50,  :default => "", :null => false
    t.string "titulo"
    t.text   "resumen"
    t.string "lugar",     :limit => 100
    t.string "paginaWeb", :limit => 100
    t.string "email",     :limit => 100
  end

  create_table "dbm_cargo", :primary_key => "idCargo", :force => true do |t|
    t.string "cargo", :limit => 100, :default => "", :null => false
  end

  create_table "dbm_comentarios", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "foro_id"
    t.string   "nombre",     :limit => 50
    t.string   "email"
    t.text     "mensaje"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbm_departamentos_de_bolivia", :primary_key => "idDepartamento", :force => true do |t|
    t.string "departamento", :limit => 50, :default => "", :null => false
  end

  create_table "dbm_descriptor_especifico", :id => false, :force => true do |t|
    t.integer "idDescriptorEspecifico",                                :null => false
    t.integer "idDescriptorGenerico",                                  :null => false
    t.string  "descriptorEspecifico",   :limit => 100, :default => "", :null => false
  end

  add_index "dbm_descriptor_especifico", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"

  create_table "dbm_descriptor_generico", :primary_key => "idDescriptorGenerico", :force => true do |t|
    t.string "descriptorGenerico", :limit => 100, :default => "", :null => false
  end

  create_table "dbm_documentos_de_interes", :primary_key => "idDocumentosInteres", :force => true do |t|
    t.string  "titulo",       :default => "", :null => false
    t.integer "idDocumentos",                 :null => false
  end

  create_table "dbm_enlace_urls", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "url"
    t.integer  "orden"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen"
    t.boolean  "mostrar",     :default => false
  end

  create_table "dbm_enlaces", :force => true do |t|
    t.string   "lactual"
    t.string   "lsiguiente"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbm_especialistas", :id => false, :force => true do |t|
    t.integer "idEspecialistas",                                     :null => false
    t.integer "idDescriptorGenerico",                                :null => false
    t.string  "nombre",               :limit => 100, :default => "", :null => false
    t.string  "telefono",             :limit => 50
    t.string  "celular",              :limit => 50
    t.text    "perfil"
    t.text    "publicacion"
    t.text    "profesion"
    t.text    "especialidad"
    t.string  "lugar",                :limit => 100
    t.string  "email",                :limit => 100
    t.string  "paginaWeb",            :limit => 100
  end

  add_index "dbm_especialistas", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"

  create_table "dbm_estadistica_usuarios", :force => true do |t|
    t.integer "user_id"
    t.integer "total"
    t.date    "fecha"
  end

  add_index "dbm_estadistica_usuarios", ["fecha"], :name => "index_dbm_estadistica_usuarios_on_fecha"

  create_table "dbm_foros", :force => true do |t|
    t.string   "titulo"
    t.text     "mensaje"
    t.integer  "puntuacion",        :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "contador",                       :default => 0
    t.integer  "comentarios_count",              :default => 0
    t.string   "autor"
  end

  create_table "dbm_imagens", :force => true do |t|
    t.string   "titulo"
    t.string   "imagen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbm_instituciones", :id => false, :force => true do |t|
    t.integer "idInstituciones",                                  :null => false
    t.integer "idTipoInstitucion",                                :null => false
    t.integer "idDepartamento",                                   :null => false
    t.string  "institucion",       :limit => 100, :default => "", :null => false
    t.string  "sigla",             :limit => 30
    t.string  "direccion",         :limit => 100
    t.string  "telefono",          :limit => 50
    t.string  "fax",               :limit => 50
    t.string  "casilla",           :limit => 50
    t.string  "email",             :limit => 100
    t.string  "paginaWeb",         :limit => 100
  end

  add_index "dbm_instituciones", ["idDepartamento"], :name => "idDepartamento"
  add_index "dbm_instituciones", ["idTipoInstitucion"], :name => "idTipoInstitucion"

  create_table "dbm_instituciones_periodisticas", :id => false, :force => true do |t|
    t.integer "idInstituciones",                                :null => false
    t.integer "idTipoMedio",                                    :null => false
    t.integer "idDepartamento",                                 :null => false
    t.string  "institucion",     :limit => 100, :default => "", :null => false
    t.string  "sigla",           :limit => 30
    t.string  "direccion",       :limit => 100
    t.string  "telefono",        :limit => 50
    t.string  "fax",             :limit => 50
    t.string  "casilla",         :limit => 50
    t.string  "email",           :limit => 100
    t.string  "paginaWeb",       :limit => 100
  end

  add_index "dbm_instituciones_periodisticas", ["idDepartamento"], :name => "idDepartamento"
  add_index "dbm_instituciones_periodisticas", ["idTipoMedio"], :name => "idTipoMedio"

  create_table "dbm_mensajes", :force => true do |t|
    t.string   "titulo"
    t.text     "mensaje"
    t.boolean  "leido",       :default => false, :null => false
    t.integer  "enviado_id"
    t.integer  "recibido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbm_ministerios", :id => false, :force => true do |t|
    t.integer "idMinisterios",                                 :null => false
    t.integer "idDepartamento",                                :null => false
    t.string  "ministerio",     :limit => 100, :default => "", :null => false
    t.string  "responsable",    :limit => 100, :default => "", :null => false
    t.string  "direccion",      :limit => 100
    t.string  "telefono",       :limit => 50
    t.string  "celular",        :limit => 100
    t.string  "fax",            :limit => 50
    t.string  "casilla",        :limit => 50
    t.string  "email",          :limit => 100
    t.string  "paginaWeb",      :limit => 100
  end

  add_index "dbm_ministerios", ["idDepartamento"], :name => "idDepartamento"

  create_table "dbm_multimedia", :primary_key => "idMultimedia", :force => true do |t|
    t.string   "titulo",                 :default => "", :null => false
    t.string   "archivo", :limit => 100, :default => "", :null => false
    t.datetime "created"
  end

  create_table "dbm_municipios_de_bolivia", :id => false, :force => true do |t|
    t.integer "idMunicipio",                                   :null => false
    t.integer "idDepartamento",                                :null => false
    t.string  "municipio",      :limit => 100, :default => "", :null => false
  end

  add_index "dbm_municipios_de_bolivia", ["idDepartamento"], :name => "idDepartamento"

  create_table "dbm_nota_destacadas", :force => true do |t|
    t.string   "titulo"
    t.text     "resumen"
    t.string   "fuente"
    t.string   "archivo"
    t.string   "enlace"
    t.string   "imagen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbm_paises", :primary_key => "idPais", :force => true do |t|
    t.string "pais", :limit => 100
  end

  create_table "dbm_partido_politico", :primary_key => "idPartidoPolitico", :force => true do |t|
    t.string "sigla",           :limit => 50,  :default => "", :null => false
    t.string "partidoPolitico", :limit => 100
  end

  create_table "dbm_periodistas", :id => false, :force => true do |t|
    t.integer "idPeriodistas",                                       :null => false
    t.integer "idInstituciones",                                     :null => false
    t.integer "idTipoMedio",                                         :null => false
    t.integer "idDepartamento",                                      :null => false
    t.integer "idDescriptorGenerico",                                :null => false
    t.integer "idCargo",                                             :null => false
    t.string  "nombre",               :limit => 100, :default => "", :null => false
    t.string  "telefono",             :limit => 50
    t.string  "celular",              :limit => 50
    t.text    "perfil"
    t.text    "profesion"
    t.text    "direccion"
    t.string  "email",                :limit => 100
  end

  add_index "dbm_periodistas", ["idDescriptorGenerico"], :name => "idDescriptorGenerico"
  add_index "dbm_periodistas", ["idInstituciones", "idTipoMedio", "idDepartamento"], :name => "idInstituciones"
  add_index "dbm_periodistas", ["idCargo"], :name => "idCargo"

  create_table "dbm_posicion_actor", :primary_key => "Id_PosicionActor", :force => true do |t|
    t.integer "Id_Actor",                              :null => false
    t.date    "fecha",                                 :null => false
    t.text    "titular",               :default => "", :null => false
    t.text    "posicion",              :default => "", :null => false
    t.text    "fuente",                :default => "", :null => false
    t.integer "Id_Descrip_Generico",                   :null => false
    t.integer "Id_Descrip_Especifico",                 :null => false
  end

  create_table "dbm_prefectos", :primary_key => "idPrefecto", :force => true do |t|
    t.integer "idDepartamento",                                :null => false
    t.string  "nombre",         :limit => 100, :default => "", :null => false
    t.string  "telefono",       :limit => 50
    t.string  "celular",        :limit => 50
    t.string  "fax",            :limit => 50
    t.string  "direccion",      :limit => 100
    t.string  "email",          :limit => 100
    t.string  "paginaWeb",      :limit => 100
  end

  add_index "dbm_prefectos", ["idDepartamento"], :name => "idDepartamento"

  create_table "dbm_primeramano", :primary_key => "idPrimeraMano", :force => true do |t|
    t.string "titular",                     :default => "", :null => false
    t.string "imagen",       :limit => 100
    t.text   "presentacion",                :default => "", :null => false
    t.date   "fecha",                                       :null => false
    t.string "fuentes"
    t.string "archivo1",     :limit => 100
    t.string "archivo2",     :limit => 100
  end

  create_table "dbm_profesiones", :primary_key => "idProfesion", :force => true do |t|
    t.string "Profesion", :limit => 60
  end

  add_index "dbm_profesiones", ["Profesion"], :name => "Profesion"

  create_table "dbm_secure_favorites", :primary_key => "idFavoritos", :force => true do |t|
    t.integer "id",                                    :null => false
    t.string  "titulo", :limit => 100
    t.string  "enlace",                :default => "", :null => false
  end

  create_table "dbm_secure_members", :force => true do |t|
    t.string    "login_smember",    :limit => 25,  :default => "", :null => false
    t.string    "pass_smember",     :limit => 25,  :default => "", :null => false
    t.string    "name_smember",     :limit => 50,  :default => "", :null => false
    t.string    "lastname_smember", :limit => 50,  :default => "", :null => false
    t.timestamp "dateReg_smember",                                 :null => false
    t.integer   "id_sprofesion",    :limit => 5,                   :null => false
    t.string    "email_smember",    :limit => 125, :default => "", :null => false
    t.integer   "numero_visitas",                  :default => 0
  end

  add_index "dbm_secure_members", ["id"], :name => "id_smember", :unique => true

  create_table "dbm_series_comparativas", :id => false, :force => true do |t|
    t.integer "idSeriesComparativas",                                  :null => false
    t.integer "idPais",                                                :null => false
    t.integer "idDescriptorGenerico",                                  :null => false
    t.integer "idDescriptorEspecifico",                                :null => false
    t.text    "hecho",                                 :default => "", :null => false
    t.text    "contexto"
    t.text    "gobierno"
    t.text    "fuentes"
    t.string  "paginaWeb",              :limit => 100
  end

  add_index "dbm_series_comparativas", ["idDescriptorEspecifico", "idDescriptorGenerico"], :name => "idDescriptorEspecifico"
  add_index "dbm_series_comparativas", ["idPais"], :name => "idPais"

  create_table "dbm_series_cronologicas", :id => false, :force => true do |t|
    t.integer "idSeriesCronologicas",                                :null => false
    t.integer "idDescriptorGenerico",                                :null => false
    t.integer "idDescriptorEspecifico",                              :null => false
    t.integer "fechaYear",              :limit => 6,                 :null => false
    t.text    "hecho",                               :default => "", :null => false
    t.text    "contexto"
    t.text    "gobierno"
    t.text    "fuentes"
  end

  add_index "dbm_series_cronologicas", ["idDescriptorEspecifico", "idDescriptorGenerico"], :name => "idDescriptorEspecifico"

  create_table "dbm_tags", :force => true do |t|
    t.string   "descripcion"
    t.integer  "ocurrencias", :default => 0
    t.integer  "enlazados",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dbm_tipo_de_institucion", :primary_key => "idTipoInstitucion", :force => true do |t|
    t.string "tipoInstitucion", :limit => 100, :default => "", :null => false
  end

  create_table "dbm_tipo_de_medio", :primary_key => "idTipoMedio", :force => true do |t|
    t.string "tipoMedio", :limit => 100, :default => "", :null => false
  end

  create_table "dbm_usuarios_cuentas", :primary_key => "idUsuario", :force => true do |t|
    t.string "login",    :limit => 15, :default => "", :null => false
    t.string "password", :limit => 15, :default => "", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "nombre",                    :limit => 100
    t.string   "apellido",                  :limit => 100
    t.integer  "total",                                    :default => 0
    t.integer  "profesion_id",                             :default => 0
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.integer  "acumulada",                                :default => 0
  end

end
