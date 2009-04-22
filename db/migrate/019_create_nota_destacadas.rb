class CreateNotaDestacadas < ActiveRecord::Migration
  def self.up
    create_table(:dbm_nota_destacadas, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci') do |t|
      t.string :titulo
      t.text :resumen
      t.string :fuente
      t.string :archivo
      t.string :enlace
      t.string :imagen

      t.timestamps
    end
  end

  def self.down
    drop_table :nota_destacadas
  end
end
