class Admin::AsambleistasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /asambleistas
  # GET /asambleistas.xml
  def index
    @asambleistas = Asambleista.paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asambleistas }
      format.print{ @asambleistas = Asambleista.find(:all); render :layout => 'imprimir' }
    end
  end

  # GET /asambleistas/1
  # GET /asambleistas/1.xml
  def show
    @asambleista = Asambleista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asambleista }
    end
  end

  # GET /asambleistas/new
  # GET /asambleistas/new.xml
  def new
    @asambleista = Asambleista.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asambleista }
    end
  end

  # GET /asambleistas/1/edit
  def edit
    @asambleista = Asambleista.find(params[:id])
  end

  # POST /asambleistas
  # POST /asambleistas.xml
  def create
    @asambleista = Asambleista.new(params[:asambleista])

    respond_to do |format|
      if @asambleista.save
        flash[:notice] = 'Asambleista se ha creado con exito.'
        format.html { redirect_to(admin_asambleistas_path) }
        format.xml  { render :xml => @asambleista, :status => :created, :location => @asambleista }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asambleista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asambleistas/1
  # PUT /asambleistas/1.xml
  def update
    @asambleista = Asambleista.find(params[:id])

    respond_to do |format|
      if @asambleista.update_attributes(params[:asambleista])
        flash[:notice] = 'Asambleista se ha actualizado con exito.'
        format.html { redirect_to(admin_asambleistas_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asambleista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asambleistas/1
  # DELETE /asambleistas/1.xml
  def destroy
    @asambleista = Asambleista.find(params[:id])
    @asambleista.destroy

    respond_to do |format|
      format.html { redirect_to(admin_asambleistas_path) }
      format.xml  { head :ok }
    end
  end
end
