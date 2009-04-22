require 'rubygems'
require 'htmlentities-4.0.0/lib/htmlentities'

class Admin::BoletinController < ApplicationController
  layout 'admin'
  require_role "administrador"
  
  def mostrar
    @coder = HTMLEntities.new
    html = render_to_string :template => "user_mailer/boletin", :layout => false
    xhtml_file = File.join(RAILS_ROOT + '/public', "boletin/#{Time.now.to_date.to_s}.html")
    File.open(xhtml_file, "w") do |file|
      file << html
    end
    flash[:notice] = nil
  end

  def enviar
    UserMailer.deliver_boletin(params[:correos], params[:titulo])
  end

  def disenar
  end
end
