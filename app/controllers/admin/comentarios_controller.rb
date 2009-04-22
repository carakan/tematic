class Admin::ComentariosController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /comentarios
  # GET /comentarios.xml
  def index
    @foro = Foro.find(params[:foro_id])
    @comentarios = @foro.comentarios.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comentarios }
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.xml
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comentario }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.xml
  def new
    @comentario = Comentario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    @comentario = Comentario.find(params[:id])
  end

  # POST /comentarios
  # POST /comentarios.xml
  def create
    @foro = Foro.find(params[:foro_id])
    @comentario = Comentario.new(params[:comentario])

    respond_to do |format|
      if @comentario.save
        @foro.comentarios << @comentario
        flash[:notice] = 'Comentario se ha creado con exito.'
        format.html { redirect_to(admin_foro_comentarios_url(params[:foro_id])) }
        format.xml  { render :xml => @comentario, :status => :created, :location => @comentario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.xml
  def update
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        flash[:notice] = 'Comentario se ha actualizado con exito.'
        format.html { redirect_to(admin_foro_comentarios_url(params[:foro_id])) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.xml
  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to(admin_foro_comentarios_url(params[:foro_id])) }
      format.xml  { head :ok }
    end
  end
end
