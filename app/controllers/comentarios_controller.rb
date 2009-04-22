class ComentariosController < ApplicationController
  layout 'login'
  # GET /comentarios/new
  # GET /comentarios/new.xml
  def new
    @comentario = Comentario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comentario }
    end
  end

  # POST /comentarios
  # POST /comentarios.xml
  def create
    @foro = Foro.find(params[:foro_id])
    @comentario = Comentario.new(params[:comentario])

    respond_to do |format|
      if @comentario.save
        @foro.comentarios << @comentario
        flash[:notice] = 'Su comentario se ha registrado.'
        format.html { redirect_to(foro_url(@foro)) }
        format.xml  { render :xml => @comentario, :status => :created, :location => @comentario }
      else
        flash[:notice] = 'No se grabo el comentario.<br>Debe de llenar todos los campos.'
        format.html { redirect_to(foro_url(@foro)) }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end
end
