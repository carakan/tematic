class Admin::CalendariosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /calendarios
  # GET /calendarios.xml
  def index
    if params[:busqueda].nil?
      if params[:tipo].nil? || params[:tipo] == ''
        @calendarios = Calendario.paginate(:per_page => 20, :page =>params[:page])
      else
        @calendarios = Calendario.paginate(:per_page => 20, :page =>params[:page], :conditions => ["tipo = ?", params[:tipo]])
      end
    else
      if params[:tipo].nil? || params[:tipo] == ''
        @calendarios = Calendario.paginate(:per_page => 20, :page =>params[:page], :conditions => ["titulo LIKE ? OR resumen LIKE ?",'%' + params[:busqueda] + '%','%' + params[:busqueda] + '%' ] )
      else
        @calendarios = Calendario.paginate(:per_page => 20, :page =>params[:page], :conditions => ["(titulo LIKE ? OR resumen LIKE ?) AND tipo = ?", '%' + params[:busqueda] + '%','%' + params[:busqueda] + '%' , params[:tipo]])
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendarios }
    end
  end

  # GET /calendarios/1
  # GET /calendarios/1.xml
  def show
    @calendario = Calendario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calendario }
    end
  end

  # GET /calendarios/new
  # GET /calendarios/new.xml
  def new
    @calendario = Calendario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendario }
    end
  end

  # GET /calendarios/1/edit
  def edit
    @calendario = Calendario.find(params[:id])
  end

  # POST /calendarios
  # POST /calendarios.xml
  def create
    @calendario = Calendario.new(params[:calendario])
    expire_fragment Time.now.to_date.to_s
    
    
    respond_to do |format|
      if @calendario.save
        flash[:notice] = 'Calendario se ha creado con exito.'
        format.html { redirect_to(admin_calendarios_url) }
        format.xml  { render :xml => @calendario, :status => :created, :location => @calendario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendarios/1
  # PUT /calendarios/1.xml
  def update
    @calendario = Calendario.find(params[:id])
    expire_fragment Time.now.to_date.to_s
    
    
    respond_to do |format|
      if @calendario.update_attributes(params[:calendario])
        flash[:notice] = 'Calendario se ha actualizado con exito.'
        format.html { redirect_to(admin_calendarios_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendarios/1
  # DELETE /calendarios/1.xml
  def destroy
    @calendario = Calendario.find(params[:id])
    @calendario.destroy
    expire_fragment Time.now.to_date.to_s
    respond_to do |format|
      format.html { redirect_to(admin_calendarios_url) }
      format.xml  { head :ok }
    end
  end
end
