class CreateTags < ActiveRecord::Migration
  def self.up
    create_table(:dbm_tags, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci')do |t|
      t.string :descripcion
      t.integer :ocurrencias, :default=>0
      t.integer :enlazados, :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
