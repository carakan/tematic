class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table(:dbm_comentarios, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci')do |t|
      t.integer :usuario_id, :foro_id
      t.string :nombre,:limit => 50
      t.string :email
      t.text :mensaje, :limit => 500 
      t.timestamps
    end
    add_index(:dbm_comentarios, :foro_id)
  end

  def self.down
    drop_table :dbm_comentarios
  end
end
