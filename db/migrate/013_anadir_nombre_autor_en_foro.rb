class AnadirNombreAutorEnForo < ActiveRecord::Migration
  def self.up
    add_column :dbm_foros, :autor, :string
  end

  def self.down
    remove_column :dbm_foros, :autor
  end
end
