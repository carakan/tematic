class AdicionDeBoolImagen < ActiveRecord::Migration
  def self.up
    add_column :dbm_enlace_urls, :mostrar, :boolean, :default => false
  end

  def self.down
    remove_column :dbm_enlace_urls, :mostrar
  end
end
