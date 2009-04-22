class Admin::ForosController < ApplicationController
  layout 'admin'
  skip_before_filter :login_required
  # GET /foros
  # GET /foros.xml
  def index
    if params[:buscar].nil?
      @foros = Foro.paginate(:per_page => 20, :page => params[:page])
    else
      @foros = Foro.paginate(:per_page => 20, :page => params[:page], :conditions => ["titulo LIKE ? OR mensaje LIKE ?", '%' + params[:buscar] + '%', '%' + params[:buscar] + '%'])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @foros }
    end
  end

  # GET /foros/1
  # GET /foros/1.xml
  def show
    @foro = Foro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foro }
    end
  end

  # GET /foros/new
  # GET /foros/new.xml
  def new
    @foro = Foro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @foro }
    end
  end

  # GET /foros/1/edit
  def edit
    @foro = Foro.find(params[:id])
  end

  # POST /foros
  # POST /foros.xml
  def create
    @foro = Foro.new(params[:foro])
    @foro.user_id = current_user.id
    
    expire_fragment Time.now.to_date.to_s
    
    respond_to do |format|
      if @foro.save
        flash[:notice] = 'Foro se ha creado con exito.'
        format.html { redirect_to(admin_foros_url) }
        format.xml  { render :xml => @foro, :status => :created, :location => @foro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @foro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /foros/1
  # PUT /foros/1.xml
  def update
    @foro = Foro.find(params[:id])
    expire_fragment Time.now.to_date.to_s
    
    respond_to do |format|
      if @foro.update_attributes(params[:foro])
        flash[:notice] = 'Foro se ha actualizado con exito.'
        format.html { redirect_to(admin_foros_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @foro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /foros/1
  # DELETE /foros/1.xml
  def destroy
    @foro = Foro.find(params[:id])
    @foro.destroy
    expire_fragment Time.now.to_date.to_s
    respond_to do |format|
      format.html { redirect_to(admin_foros_url) }
      format.xml  { head :ok }
    end
  end
end
