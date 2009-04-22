class Admin::NotaDestacadasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /nota_destacadas
  # GET /nota_destacadas.xml
  def index
    if params[:buscar].nil?
      @nota_destacadas = NotaDestacada.paginate(:per_page => 20, :page => params[:page])
    else
      @nota_destacadas = NotaDestacada.paginate(:per_page => 20, :page => params[:page], :conditions => ["titulo LIKE ? OR resumen LIKE ?", '%' + params[:buscar] + '%', '%' + params[:buscar] + '%'])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nota_destacadas }
    end
  end

  # GET /nota_destacadas/1
  # GET /nota_destacadas/1.xml
  def show
    @nota_destacada = NotaDestacada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nota_destacada }
    end
  end

  # GET /nota_destacadas/new
  # GET /nota_destacadas/new.xml
  def new
    @nota_destacada = NotaDestacada.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nota_destacada }
    end
  end

  # GET /nota_destacadas/1/edit
  def edit
    @nota_destacada = NotaDestacada.find(params[:id])
  end

  # POST /nota_destacadas
  # POST /nota_destacadas.xml
  def create
    @nota_destacada = NotaDestacada.new(params[:nota_destacada])
    expire_fragment Time.now.to_date.to_s
    expire_fragment '/ultimo'
    
    respond_to do |format|
      if @nota_destacada.save
        flash[:notice] = 'NotaDestacada se creo exitosamente..'
        format.html { redirect_to(admin_nota_destacadas_url) }
        format.xml  { render :xml => @nota_destacada, :status => :created, :location => @nota_destacada }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nota_destacada.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nota_destacadas/1
  # PUT /nota_destacadas/1.xml
  def update
    @nota_destacada = NotaDestacada.find(params[:id])

    expire_fragment Time.now.to_date.to_s
    expire_fragment '/ultimo'
    
    respond_to do |format|
      if @nota_destacada.update_attributes(params[:nota_destacada])
        flash[:notice] = 'NotaDestacada se ha actualizado con exito..'
        format.html { redirect_to(admin_nota_destacadas_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nota_destacada.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nota_destacadas/1
  # DELETE /nota_destacadas/1.xml
  def destroy
    @nota_destacada = NotaDestacada.find(params[:id])
    @nota_destacada.destroy
    
    expire_fragment Time.now.to_date.to_s
    expire_fragment '/ultimo'
    
    respond_to do |format|
      format.html { redirect_to(admin_nota_destacadas_url) }
      format.xml  { head :ok }
    end
  end
end
