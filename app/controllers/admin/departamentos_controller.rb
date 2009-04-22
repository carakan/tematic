class Admin::DepartamentosController < ApplicationController
  layout 'admin'
  require_role "administrador"
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
    @departamento = Departamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @departamento }
    end
  end

  # GET /departamentos/new
  # GET /departamentos/new.xml
  def new
    @departamento = Departamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @departamento }
    end
  end

  # GET /departamentos/1/edit
  def edit
    @departamento = Departamento.find(params[:id])
  end

  # POST /departamentos
  # POST /departamentos.xml
  def create
    @departamento = Departamento.new(params[:departamento])

    respond_to do |format|
      if @departamento.save
        flash[:notice] = 'Departamento se ha creado con exito.'
        format.html { redirect_to(admin_departamentos_path) }
        format.xml  { render :xml => @departamento, :status => :created, :location => @departamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @departamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /departamentos/1
  # PUT /departamentos/1.xml
  def update
    @departamento = Departamento.find(params[:id])

    respond_to do |format|
      if @departamento.update_attributes(params[:departamento])
        flash[:notice] = 'Departamento se ha actualizado con exito.'
        format.html { redirect_to(admin_departamentos_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @departamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.xml
  def destroy
    @departamento = Departamento.find(params[:id])
    @departamento.destroy

    respond_to do |format|
      format.html { redirect_to(admin_departamentos_path) }
      format.xml  { head :ok }
    end
  end
end
