class Admin::AdministradoresController < ApplicationController
  layout 'admin'
  require_role "administrador"
  
  def index
    
  end

  def new
  end

  def destroy
  end
end
