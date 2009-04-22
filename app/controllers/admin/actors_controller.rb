class Admin::ActorsController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /actors
  # GET /actors.xml
  def index
    @actors = Actor.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @actors }
    end
  end

  # GET /actors/1
  # GET /actors/1.xml
  def show
    @actor = Actor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @actor }
    end
  end

  # GET /actors/new
  # GET /actors/new.xml
  def new
    @actor = Actor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @actor }
    end
  end

  # GET /actors/1/edit
  def edit
    @actor = Actor.find(params[:id])
  end

  # POST /actors
  # POST /actors.xml
  def create
    @actor = Actor.new(params[:actor])

    respond_to do |format|
      if @actor.save
        flash[:notice] = 'Actor se ha creado con exito.'
        format.html { redirect_to(admin_actors_path) }
        format.xml  { render :xml => @actor, :status => :created, :location => @actor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @actor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /actors/1
  # PUT /actors/1.xml
  def update
    @actor = Actor.find(params[:id])

    respond_to do |format|
      if @actor.update_attributes(params[:actor])
        flash[:notice] = 'Actor se ha actualizado con exito.'
        format.html { redirect_to(admin_actors_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @actor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.xml
  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy

    respond_to do |format|
      format.html { redirect_to(admin_actors_url) }
      format.xml  { head :ok }
    end
  end
end
