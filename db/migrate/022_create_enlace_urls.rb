class CreateEnlaceUrls < ActiveRecord::Migration
  def self.up
    create_table(:dbm_enlace_urls, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci') do |t|
      t.string :nombre
      t.string :descripcion
      t.string :url
      t.integer :orden
      t.timestamps
    end
  end

  def self.down
    drop_table :enlace_urls
  end
end
