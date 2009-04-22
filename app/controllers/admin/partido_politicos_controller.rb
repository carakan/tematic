class Admin::PartidoPoliticosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /partido_politicos
  # GET /partido_politicos.xml
  def index
    @partido_politicos = PartidoPolitico.paginate(:per_page => 20, :page =>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partido_politicos }
    end
  end

  # GET /partido_politicos/1
  # GET /partido_politicos/1.xml
  def show
    @partido_politico = PartidoPolitico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partido_politico }
    end
  end

  # GET /partido_politicos/new
  # GET /partido_politicos/new.xml
  def new
    @partido_politico = PartidoPolitico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partido_politico }
    end
  end

  # GET /partido_politicos/1/edit
  def edit
    @partido_politico = PartidoPolitico.find(params[:id])
  end

  # POST /partido_politicos
  # POST /partido_politicos.xml
  def create
    @partido_politico = PartidoPolitico.new(params[:partido_politico])

    respond_to do |format|
      if @partido_politico.save
        flash[:notice] = 'PartidoPolitico se ha creado con exito.'
        format.html { redirect_to(admin_partido_politicos_url) }
        format.xml  { render :xml => @partido_politico, :status => :created, :location => @partido_politico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partido_politico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partido_politicos/1
  # PUT /partido_politicos/1.xml
  def update
    @partido_politico = PartidoPolitico.find(params[:id])

    respond_to do |format|
      if @partido_politico.update_attributes(params[:partido_politico])
        flash[:notice] = 'PartidoPolitico se ha actualizado con exito.'
        format.html { redirect_to(admin_partido_politicos_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partido_politico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partido_politicos/1
  # DELETE /partido_politicos/1.xml
  def destroy
    @partido_politico = PartidoPolitico.find(params[:id])
    @partido_politico.destroy

    respond_to do |format|
      format.html { redirect_to(admin_partido_politicos_url) }
      format.xml  { head :ok }
    end
  end
end
