class Admin::ProfesionsController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /profesions
  # GET /profesions.xml
  def index
    @profesions = Profesion.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profesions }
    end
  end

  # GET /profesions/1
  # GET /profesions/1.xml
  def show
    @profesion = Profesion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profesion }
    end
  end

  # GET /profesions/new
  # GET /profesions/new.xml
  def new
    @profesion = Profesion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profesion }
    end
  end

  # GET /profesions/1/edit
  def edit
    @profesion = Profesion.find(params[:id])
  end

  # POST /profesions
  # POST /profesions.xml
  def create
    @profesion = Profesion.new(params[:profesion])

    respond_to do |format|
      if @profesion.save
        flash[:notice] = 'Profesion se ha creado con exito.'
        format.html { redirect_to(admin_profesions_url) }
        format.xml  { render :xml => @profesion, :status => :created, :location => @profesion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profesion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profesions/1
  # PUT /profesions/1.xml
  def update
    @profesion = Profesion.find(params[:id])

    respond_to do |format|
      if @profesion.update_attributes(params[:profesion])
        flash[:notice] = 'Profesion se ha actualizado con exito.'
        format.html { redirect_to(admin_profesions_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profesion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profesions/1
  # DELETE /profesions/1.xml
  def destroy
    @profesion = Profesion.find(params[:id])
    @profesion.destroy

    respond_to do |format|
      format.html { redirect_to(admin_profesions_url) }
      format.xml  { head :ok }
    end
  end
end
