class CreateImagens < ActiveRecord::Migration
  def self.up
    create_table(:dbm_imagens, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci') do |t|
      t.string :titulo
      t.string :imagen

      t.timestamps
    end
  end

  def self.down
    drop_table :imagens
  end
end
