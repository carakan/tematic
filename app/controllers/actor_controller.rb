class ActorController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
  # GET /actors
  # GET /actors.xml
  def index
    @actors = Actor.find(:all, :offset => params[:offset], :limit => 10, :order => 'Id_Actor DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @actors }
      format.js   {}
    end
  end

  # GET /actors/1
  # GET /actors/1.xml
  def mostrar
    @actor = Actor.find(params[:id])
    @hechos = @actor.posicion_actors.paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html {@actors = Actor.find(:all, :offset => params[:offset], :limit => 12)}
      format.xml  { render :xml => @actor }
      format.js   {}
    end
  end
  
  def acontecimiento
    @hecho = PosicionActor.find(params[:id])
    render :partial => 'acontecimiento', :layout => false
  end
end
