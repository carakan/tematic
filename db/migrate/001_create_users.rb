class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table("users", :force => true, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci') do |t|
      t.string :nombre, :apellido, :limit => 100
      t.integer :mensual, :total, :profesion_id, :default => 0
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code, :string, :limit => 40
      t.column :activated_at, :datetime
    end
  end

  def self.down
    drop_table "users"
  end
end
