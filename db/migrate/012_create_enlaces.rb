class CreateEnlaces < ActiveRecord::Migration
  def self.up
    create_table(:dbm_enlaces, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci')do |t|
      t.string :lactual
      t.string :lsiguiente
      t.integer :tag_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :dbm_enlaces
  end
end
