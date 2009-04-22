class CreateEstadisticaUsuarios < ActiveRecord::Migration
  def self.up
    create_table(:dbm_estadistica_usuarios, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci') do |t|
      t.integer :user_id
      t.integer :total
      t.integer :mensual
      t.date :fecha
    end
    
    add_index(:dbm_estadistica_usuarios, :fecha)
    add_index(:dbm_estadistica_usuarios, :user_id)
    
    add_column "users", "password_reset_code", :string, :limit => 40
    
    remove_column(:users, :mensual)
  end

  def self.down
    drop_table :estadistica_usuarios
  end
end
