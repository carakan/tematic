class DepartamentosController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
  # GET /departamentos
  # GET /departamentos.xml
  def index
    @departamentos = Departamento.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departamentos }
    end
  end

  # GET /departamentos/1
  # GET /departamentos/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @departamento }
    end
  end
end
