class AdicionDeAcumuladaYImagen < ActiveRecord::Migration
  def self.up
    add_column(:users, :acumulada, :integer, :default => 0)
    add_column(:dbm_enlace_urls, :imagen, :string)
    remove_column(:dbm_estadistica_usuarios, :mensual)
  end

  def self.down
    remove_column(:users, :acumulada)
    remove_column(:dbm_enlace_urls, :imagen)
  end
end
