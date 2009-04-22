class Admin::DocumentoInteresController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /documento_interes
  # GET /documento_interes.xml
  def index
    @documento_interes = DocumentoIntere.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documento_interes }
    end
  end

  # GET /documento_interes/1
  # GET /documento_interes/1.xml
  def show
    @documento_intere = DocumentoIntere.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @documento_intere }
    end
  end

  # GET /documento_interes/new
  # GET /documento_interes/new.xml
  def new
    @documento_intere = DocumentoIntere.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documento_intere }
    end
  end

  # GET /documento_interes/1/edit
  def edit
    @documento_intere = DocumentoIntere.find(params[:id])
  end

  # POST /documento_interes
  # POST /documento_interes.xml
  def create
    @documento_intere = DocumentoIntere.new(params[:documento_intere])

    respond_to do |format|
      if @documento_intere.save
        flash[:notice] = 'DocumentoIntere se ha creado con exito.'
        format.html { redirect_to(admin_documento_interes_path) }
        format.xml  { render :xml => @documento_intere, :status => :created, :location => @documento_intere }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @documento_intere.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documento_interes/1
  # PUT /documento_interes/1.xml
  def update
    @documento_intere = DocumentoIntere.find(params[:id])

    respond_to do |format|
      if @documento_intere.update_attributes(params[:documento_intere])
        flash[:notice] = 'DocumentoIntere se ha actualizado con exito.'
        format.html { redirect_to(admin_documento_interes_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documento_intere.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documento_interes/1
  # DELETE /documento_interes/1.xml
  def destroy
    @documento_intere = DocumentoIntere.find(params[:id])
    @documento_intere.destroy

    respond_to do |format|
      format.html { redirect_to(admin_documento_interes_path) }
      format.xml  { head :ok }
    end
  end
end
