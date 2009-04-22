class Admin::DocumentosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /documentos
  # GET /documentos.xml
  def index
    if params[:generico].nil? || params[:generico] == 'Todos'
      if params[:buscar].nil? || params[:buscar] == ""
        @documentos = Documento.paginate(:per_page => 20, :page => params[:page])
      else
        @documentos = Documento.paginate(:per_page => 20, :page => params[:page], :conditions => ["tituloMonografia LIKE ? OR autorMonografia LIKE ?", '%' + params[:buscar] + '%', '%' + params[:buscar] + '%'])
      end
    else
      if params[:buscar].nil? || params[:buscar] == ""
        @documentos = Documento.paginate(:per_page => 20, :page => params[:page], :conditions =>["idDescriptorGenerico = ?", params[:generico]])
      else
        @documentos = Documento.paginate(:per_page => 20, :page => params[:page], :conditions =>["(tituloMonografia LIKE ? OR autorMonografia LIKE ?) AND idDescriptorGenerico = ?", '%' + params[:buscar] + '%', '%' + params[:buscar] + '%', params[:generico]])
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documentos }
    end
  end

  # GET /documentos/1
  # GET /documentos/1.xml
  def show
    @documento = Documento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /documentos/new
  # GET /documentos/new.xml
  def new
    @documento = Documento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /documentos/1/edit
  def edit
    @documento = Documento.find(params[:id])
  end

  # POST /documentos
  # POST /documentos.xml
  def create
    @documento = Documento.new(params[:documento])
    respond_to do |format|
      if @documento.save
        flash[:notice] = 'El documento se ha creado con exito'
        if params[:interes]
          @interes = DocumentoIntere.create(:titulo => @documento.tituloMonografia, :idDocumentos => @documento.id)
          flash[:notice] += ' y se creo su enlace a documentos de interes.'
          expire_fragment Time.now.to_date.to_s
        end
        format.html { redirect_to(admin_documentos_url) }
        format.xml  { render :xml => @documento, :status => :created, :location => @documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documentos/1
  # PUT /documentos/1.xml
  def update
    @documento = Documento.find(params[:id])

    respond_to do |format|
      if @documento.update_attributes(params[:documento])
        flash[:notice] = 'Documento se ha actualizado con exito.'
        format.html { redirect_to(admin_documentos_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.xml
  def destroy
    @documento = Documento.find(params[:id])
    @documento.destroy

    respond_to do |format|
      format.html { redirect_to(admin_documentos_url) }
      format.xml  { head :ok }
    end
  end
end
