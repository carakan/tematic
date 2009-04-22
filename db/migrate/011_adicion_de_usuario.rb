class AdicionDeUsuario < ActiveRecord::Migration
  def self.up
    add_column :dbm_foros, :user_id, :integer
    add_column :dbm_foros, :contador, :integer, :default => 0
    add_column :dbm_foros, :comentarios_count, :integer, :default => 0
  end

  def self.down
    remove_column :dbm_foros, :user_id
    remove_column :dbm_foros, :contador
    remove_column :dbm_foros, :comentarios_count
  end
end
