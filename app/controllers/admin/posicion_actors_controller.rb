class Admin::PosicionActorsController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /posicion_actors
  # GET /posicion_actors.xml
  def index
    if params[:actor_id]
      @actor = Actor.find(params[:actor_id])
      @posicion_actors = @actor.posicion_actors.paginate(:per_page => 20, :page => params[:page])
    else
      @posicion_actors = PosicionActor.paginate(:per_page => 20, :page => params[:page])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posicion_actors }
    end
  end

  # GET /posicion_actors/1
  # GET /posicion_actors/1.xml
  def show
    @posicion_actor = PosicionActor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @posicion_actor }
    end
  end

  # GET /posicion_actors/new
  # GET /posicion_actors/new.xml
  def new
    @actor = Actor.find(params[:actor_id])
    @posicion_actor = PosicionActor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @posicion_actor }
    end
  end

  # GET /posicion_actors/1/edit
  def edit
    @posicion_actor = PosicionActor.find(params[:id])
  end

  # POST /posicion_actors
  # POST /posicion_actors.xml
  def create
    @posicion_actor = PosicionActor.new(params[:posicion_actor])
    @posicion_actor.Id_Actor = params[:actor_id]
    respond_to do |format|
      if @posicion_actor.save
        flash[:notice] = 'PosicionActor se ha creado con exito.'
        format.html { redirect_to(admin_posicion_actors_url) }
        format.xml  { render :xml => @posicion_actor, :status => :created, :location => @posicion_actor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @posicion_actor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posicion_actors/1
  # PUT /posicion_actors/1.xml
  def update
    @posicion_actor = PosicionActor.find(params[:id])

    respond_to do |format|
      if @posicion_actor.update_attributes(params[:posicion_actor])
        flash[:notice] = 'PosicionActor se ha actualizado con exito.'
        format.html { redirect_to(admin_posicion_actors_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @posicion_actor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posicion_actors/1
  # DELETE /posicion_actors/1.xml
  def destroy
    @posicion_actor = PosicionActor.find(params[:id])
    @posicion_actor.destroy

    respond_to do |format|
      format.html { redirect_to(admin_posicion_actors_url) }
      format.xml  { head :ok }
    end
  end
end
