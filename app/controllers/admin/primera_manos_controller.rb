class Admin::PrimeraManosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /primera_manos
  # GET /primera_manos.xml
  def index
    if params[:busqueda].nil?
      @primera_manos = PrimeraMano.paginate(:per_page => 10, :page =>params[:page], :order => 'idPrimeraMano DESC')
    else
      @primera_manos = PrimeraMano.paginate(:per_page => 10, :page =>params[:page], :order => 'idPrimeraMano DESC', :conditions => ["titular LIKE ? OR presentacion LIKE ?",'%' + params[:busqueda] + '%','%' + params[:busqueda] + '%' ] )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.rss { render :rss => 'index', :layout => false }
    end
  end

  # GET /primera_manos/1
  # GET /primera_manos/1.xml
  def show
    @primera_mano = PrimeraMano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @primera_mano }
    end
  end

  # GET /primera_manos/new
  # GET /primera_manos/new.xml
  def new
    @primera_mano = PrimeraMano.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @primera_mano }
    end
  end

  # GET /primera_manos/1/edit
  def edit
    @primera_mano = PrimeraMano.find(params[:id])
  end

  # POST /primera_manos
  # POST /primera_manos.xml
  def create
    @primera_mano = PrimeraMano.new(params[:primera_mano])
    expire_fragment Time.now.to_date.to_s
    expire_fragment '/ultimo'
    @primera_mano.fecha = parse_date(params[:fecha])
    
    respond_to do |format|
      if @primera_mano.save
        flash[:notice] = 'PrimeraMano se ha creado con exito.'
        format.html { redirect_to(admin_primera_manos_url) }
        format.xml  { render :xml => @primera_mano, :status => :created, :location => @primera_mano }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @primera_mano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /primera_manos/1
  # PUT /primera_manos/1.xml
  def update
    @primera_mano = PrimeraMano.find_by_idPrimeraMano(params[:id].to_i)
    
    respond_to do |format|
      if @primera_mano.update_attributes(params[:primera_mano]) && 
          flash[:notice] = 'PrimeraMano se ha actualizado con exito.'
        
        expire_fragment Time.now.to_date.to_s
        expire_fragment '/ultimo'
        
        format.html { redirect_to(admin_primera_manos_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @primera_mano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /primera_manos/1
  # DELETE /primera_manos/1.xml
  def destroy
    @primera_mano = PrimeraMano.find(params[:id])
    @primera_mano.destroy
    
    expire_fragment Time.now.to_date.to_s
    expire_fragment '/ultimo'
    
    respond_to do |format|
      format.html { redirect_to(admin_primera_manos_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def parse_date(date)
    if date =~ /(\d{1,2})\/(\d{1,2})\/(\d{4})/
      "#{$3}-#{$2}-#{$1}"
    end
  end
end
