class CreateMensajes < ActiveRecord::Migration
  def self.up
    create_table(:dbm_mensajes, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci') do |t|
      t.string :titulo
      t.text :mensaje
      t.boolean :leido, :default => false, :null => false
      t.integer :enviado_id, :recibido_id
      t.timestamps
    end
    add_index(:dbm_mensajes, :enviado_id)
    add_index(:dbm_mensajes, :recibido_id)
  end

  def self.down
    drop_table :mensajes
  end
end
