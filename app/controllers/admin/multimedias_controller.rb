class Admin::MultimediasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /multimedias
  # GET /multimedias.xml
  def index
    respond_to do |format|
      format.html {@multimedias = Multimedia.paginate(:per_page => 20, :page => params[:page])}
      format.xml do 
        html = render_to_string :template => "sitemap", :layout => false
        xhtml_file = File.join(RAILS_ROOT + '/public', "sitemap.xml")
        File.open(xhtml_file, "w") do |file|
          file << html
        end
        flash[:notice] = 'El archivo Sitemap se ha creado con exito.'
        redirect_to(admin_multimedias_url)
      end
    end

    # GET /multimedias/1
    # GET /multimedias/1.xml
    def show
      @multimedia = Multimedia.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @multimedia }
      end
    end
  end

  # GET /multimedias/new
  # GET /multimedias/new.xml
  def new
    @multimedia = Multimedia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @multimedia }
    end
  end

  # GET /multimedias/1/edit
  def edit
    @multimedia = Multimedia.find(params[:id])
  end

  # POST /multimedias
  # POST /multimedias.xml
  def create
    @multimedia = Multimedia.new(params[:multimedia])

    respond_to do |format|
      if @multimedia.save
        flash[:notice] = 'Multimedia se ha creado con exito.'
        format.html { redirect_to(admin_multimedias_path) }
        format.xml  { render :xml => @multimedia, :status => :created, :location => @multimedia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @multimedia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /multimedias/1
  # PUT /multimedias/1.xml
  def update
    @multimedia = Multimedia.find(params[:id])

    respond_to do |format|
      if @multimedia.update_attributes(params[:multimedia])
        flash[:notice] = 'Multimedia se ha actualizado con exito.'
        format.html { redirect_to(admin_multimedias_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @multimedia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedias/1
  # DELETE /multimedias/1.xml
  def destroy
    @multimedia = Multimedia.find(params[:id])
    @multimedia.destroy

    respond_to do |format|
      format.html { redirect_to(admin_multimedias_url) }
      format.xml  { head :ok }
    end
  end
  
  def sitemap
    html = render_to_string :template => "sitemap", :layout => false
    xhtml_file = File.join(RAILS_ROOT + '/public', "sitemap.xml")
    File.open(xhtml_file, "w") do |file|
      file << html
    end
    flash[:notice] = 'El archivo Sitemap se ha creado con exito.'
    redirect_to(admin_multimedias_url)
  end
end
