class MigracionDeDatos < ActiveRecord::Migration
  def self.up
    Member.find(:all).each do |m|
      admin = User.create(:nombre => m.name_smember, :apellido => m.lastname_smember, :login => m.login_smember, :email => m.email_smember,:password => m.pass_smember,:password_confirmation => m.pass_smember, :profesion_id => m.id_sprofesion)
      admin.activate
      admin.update_attribute(:total, m.numero_visitas)
    end
  end

  def self.down
  end
end
