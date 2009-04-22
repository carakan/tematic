class Admin::DescriptorEspecificosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /descriptor_especificos
  # GET /descriptor_especificos.xml
  def index
    @descriptor_especificos = DescriptorEspecifico.paginate(:per_page => 20, :page =>params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @descriptor_especificos }
    end
  end

  # GET /descriptor_especificos/1
  # GET /descriptor_especificos/1.xml
  def show
    @descriptor_especifico = DescriptorEspecifico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @descriptor_especifico }
    end
  end

  # GET /descriptor_especificos/new
  # GET /descriptor_especificos/new.xml
  def new
    @descriptor_especifico = DescriptorEspecifico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @descriptor_especifico }
    end
  end

  # GET /descriptor_especificos/1/edit
  def edit
    @descriptor_especifico = DescriptorEspecifico.find(params[:id])
  end

  # POST /descriptor_especificos
  # POST /descriptor_especificos.xml
  def create
    @descriptor_especifico = DescriptorEspecifico.new(params[:descriptor_especifico])

    respond_to do |format|
      if @descriptor_especifico.save
        flash[:notice] = 'DescriptorEspecifico se creo exitosamente..'
        format.html { redirect_to(admin_descriptor_especificos_url) }
        format.xml  { render :xml => @descriptor_especifico, :status => :created, :location => @descriptor_especifico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @descriptor_especifico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /descriptor_especificos/1
  # PUT /descriptor_especificos/1.xml
  def update
    @descriptor_especifico = DescriptorEspecifico.find(params[:id])

    respond_to do |format|
      if @descriptor_especifico.update_attributes(params[:descriptor_especifico])
        flash[:notice] = 'DescriptorEspecifico se ha actualizado con exito..'
        format.html { redirect_to(admin_descriptor_especificos_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @descriptor_especifico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /descriptor_especificos/1
  # DELETE /descriptor_especificos/1.xml
  def destroy
    @descriptor_especifico = DescriptorEspecifico.find(params[:id])
    @descriptor_especifico.destroy

    respond_to do |format|
      format.html { redirect_to(admin_descriptor_especificos_url) }
      format.xml  { head :ok }
    end
  end
end
