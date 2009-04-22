class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table("roles", :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci')do |t|
      t.column :name, :string
    end
    
    # generate the join table
    create_table("roles_users", :id => false, :options => 'DEFAULT CHARSET = latin1 COLLATE latin1_spanish_ci')do |t|
      t.column "role_id", :integer
      t.column "user_id", :integer
    end
    add_index "roles_users", "role_id"
    add_index "roles_users", "user_id"
    
    # Creacion del rol de administrador
    rol_admin = Role.create(:name =>'administrador')
    # Creacion de la cuenta de administracion
    admin = User.create(:nombre => 'carlos', :apellido => 'ramos', :login => 'admin', :email => 'carakan@gmail.com',:password => 'gotama',:password_confirmation => 'gotama', :profesion_id => 1)
    admin.activate    
    admin.roles << rol_admin
  end

  def self.down
    drop_table "roles"
    drop_table "roles_users"
  end
end