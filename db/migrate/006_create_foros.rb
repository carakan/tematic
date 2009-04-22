class CreateForos < ActiveRecord::Migration
  def self.up
    create_table(:dbm_foros, :force => true, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci')do |t|
      t.string :titulo
      t.text :mensaje
      t.integer :puntuacion, :limit => 5 
      t.timestamps
    end
  end

  def self.down
    drop_table :dbm_foros
  end
end
