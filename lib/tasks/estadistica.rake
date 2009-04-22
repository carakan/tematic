require 'rubygems'

namespace :estadistica do
  desc "Hacer las estadisticas de ingreso al sitio"
  task(:user => :environment) do #*2
    for user in User.find(:all, :conditions => 'total > 0')
      EstadisticaUsuario.create(:user_id => user.id, :total => user.total, :fecha => Time.now )
    end
    User.update_all('acumulada = total + acumulada', '1=1')
    User.update_all('total = 0', '1=1')
  end
end 