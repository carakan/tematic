class Admin::FavoritosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /favoritos
  # GET /favoritos.xml
  def index
    @favoritos = Favorito.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favoritos }
    end
  end

  # GET /favoritos/1
  # GET /favoritos/1.xml
  def show
    @favorito = Favorito.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favorito }
    end
  end

  # GET /favoritos/new
  # GET /favoritos/new.xml
  def new
    @favorito = Favorito.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @favorito }
    end
  end

  # GET /favoritos/1/edit
  def edit
    @favorito = Favorito.find(params[:id])
  end

  # POST /favoritos
  # POST /favoritos.xml
  def create
    @favorito = Favorito.new(params[:favorito])

    respond_to do |format|
      if @favorito.save
        flash[:notice] = 'Favorito se ha creado con exito.'
        format.html { redirect_to(admin_favoritos_path) }
        format.xml  { render :xml => @favorito, :status => :created, :location => @favorito }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favorito.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favoritos/1
  # PUT /favoritos/1.xml
  def update
    @favorito = Favorito.find(params[:id])

    respond_to do |format|
      if @favorito.update_attributes(params[:favorito])
        flash[:notice] = 'Favorito se ha actualizado con exito.'
        format.html { redirect_to(admin_favoritos_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favorito.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favoritos/1
  # DELETE /favoritos/1.xml
  def destroy
    @favorito = Favorito.find(params[:id])
    @favorito.destroy

    respond_to do |format|
      format.html { redirect_to(admin_favoritos_path) }
      format.xml  { head :ok }
    end
  end
end
