class Admin::BibliografiasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /bibliografias
  # GET /bibliografias.xml
  def index
    
    @bibliografias = Bibliografia.busqueda(params[:page], params[:generico], params[:buscar], 20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bibliografias }
    end
  end

  # GET /bibliografias/1
  # GET /bibliografias/1.xml
  def show
    @bibliografia = Bibliografia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bibliografia }
    end
  end

  # GET /bibliografias/new
  # GET /bibliografias/new.xml
  def new
    @bibliografia = Bibliografia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bibliografia }
    end
  end

  # GET /bibliografias/1/edit
  def edit
    @bibliografia = Bibliografia.find(params[:id])
  end

  # POST /bibliografias
  # POST /bibliografias.xml
  def create
    @bibliografia = Bibliografia.new(params[:bibliografia])

    respond_to do |format|
      if @bibliografia.save
        flash[:notice] = 'Bibliografia se ha creado con exito.'
        format.html { redirect_to(admin_bibliografias_url) }
        format.xml  { render :xml => @bibliografia, :status => :created, :location => @bibliografia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bibliografia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bibliografias/1
  # PUT /bibliografias/1.xml
  def update
    @bibliografia = Bibliografia.find(params[:id])

    respond_to do |format|
      if @bibliografia.update_attributes(params[:bibliografia])
        flash[:notice] = 'Bibliografia se ha actualizado con exito.'
        format.html { redirect_to(admin_bibliografias_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bibliografia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliografias/1
  # DELETE /bibliografias/1.xml
  def destroy
    @bibliografia = Bibliografia.find(params[:id])
    @bibliografia.destroy

    respond_to do |format|
      format.html { redirect_to(admin_bibliografias_url) }
      format.xml  { head :ok }
    end
  end
end
