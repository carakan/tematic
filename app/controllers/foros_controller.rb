class ForosController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
  # GET /foros
  # GET /foros.xml
  def index
    @foros = Foro.paginate(:per_page => 20, :page => params[:page], :order => 'id DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @foros }
    end
  end

  # GET /foros/1
  # GET /foros/1.xml
  def show
    @foro = Foro.find(params[:id])
    @foro.update_attribute(:contador, @foro.contador + 1 )
    @comentarios = @foro.comentarios.paginate(:per_page => 10, :page => params[:page])
    @comentario = Comentario.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foro }
    end
  end
end
