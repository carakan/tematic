class Admin::DescriptorGenericosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /descriptor_genericos
  # GET /descriptor_genericos.xml
  def index
    @descriptor_genericos = DescriptorGenerico.paginate(:per_page => 20, :page =>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @descriptor_genericos }
    end
  end

  # GET /descriptor_genericos/1
  # GET /descriptor_genericos/1.xml
  def show
    @descriptor_generico = DescriptorGenerico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @descriptor_generico }
    end
  end

  # GET /descriptor_genericos/new
  # GET /descriptor_genericos/new.xml
  def new
    @descriptor_generico = DescriptorGenerico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @descriptor_generico }
    end
  end

  # GET /descriptor_genericos/1/edit
  def edit
    @descriptor_generico = DescriptorGenerico.find(params[:id])
  end

  # POST /descriptor_genericos
  # POST /descriptor_genericos.xml
  def create
    @descriptor_generico = DescriptorGenerico.new(params[:descriptor_generico])

    respond_to do |format|
      if @descriptor_generico.save
        flash[:notice] = 'Descriptor Generico se ha creado con exito.'
        format.html { redirect_to(admin_descriptor_genericos_url) }
        format.xml  { render :xml => @descriptor_generico, :status => :created, :location => @descriptor_generico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @descriptor_generico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /descriptor_genericos/1
  # PUT /descriptor_genericos/1.xml
  def update
    @descriptor_generico = DescriptorGenerico.find(params[:id])

    respond_to do |format|
      if @descriptor_generico.update_attributes(params[:descriptor_generico])
        flash[:notice] = 'Descriptor Generico se ha actualizado con exito.'
        format.html { redirect_to(admin_descriptor_genericos_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @descriptor_generico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /descriptor_genericos/1
  # DELETE /descriptor_genericos/1.xml
  def destroy
    @descriptor_generico = DescriptorGenerico.find(params[:id])
    @descriptor_generico.destroy

    respond_to do |format|
      format.html { redirect_to(admin_descriptor_genericos_url) }
      format.xml  { head :ok }
    end
  end
end
