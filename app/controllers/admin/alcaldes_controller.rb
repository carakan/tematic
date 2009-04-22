class Admin::AlcaldesController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /alcaldes
  # GET /alcaldes.xml
  def index
    @alcaldes = Alcalde.paginate(:per_page => 20, :page => params[:page], :include => :departamento)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alcaldes }
      format.print{ @alcaldes = Alcalde.find(:all); render :layout => 'imprimir' }
    end
  end

  # GET /alcaldes/1
  # GET /alcaldes/1.xml
  def show
    @alcalde = Alcalde.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alcalde }
    end
  end

  # GET /alcaldes/new
  # GET /alcaldes/new.xml
  def new
    @alcalde = Alcalde.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alcalde }
    end
  end

  # GET /alcaldes/1/edit
  def edit
    @alcalde = Alcalde.find(params[:id])
  end

  # POST /alcaldes
  # POST /alcaldes.xml
  def create
    @alcalde = Alcalde.new(params[:alcalde])

    respond_to do |format|
      if @alcalde.save
        flash[:notice] = 'Alcalde se ha creado con exito.'
        format.html { redirect_to(admin_alcaldes_url) }
        format.xml  { render :xml => @alcalde, :status => :created, :location => @alcalde }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alcalde.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alcaldes/1
  # PUT /alcaldes/1.xml
  def update
    @alcalde = Alcalde.find(params[:id])

    respond_to do |format|
      if @alcalde.update_attributes(params[:alcalde])
        flash[:notice] = 'Alcalde se ha actualizado con exito.'
        format.html { redirect_to(admin_alcaldes_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alcalde.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alcaldes/1
  # DELETE /alcaldes/1.xml
  def destroy
    @alcalde = Alcalde.find(params[:id])
    @alcalde.destroy

    respond_to do |format|
      format.html { redirect_to(admin_alcaldes_url) }
      format.xml  { head :ok }
    end
  end
end
