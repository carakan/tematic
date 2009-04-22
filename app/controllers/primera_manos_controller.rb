class PrimeraManosController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
  # GET /primera_manos
  # GET /primera_manos.xml
  def index
    if params[:busqueda].nil?
      @primera_manos = PrimeraMano.paginate(:per_page => 10, :page =>params[:page], :order => 'fecha DESC')    
    else
      @primera_manos = PrimeraMano.paginate(:per_page => 10, :page =>params[:page], :order => 'fecha DESC', :conditions => ["titular LIKE ? OR presentacion LIKE ?", '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%'])    
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.rss { render :rss => 'index', :layout => false }
    end
  end

  # GET /primera_manos/1
  # GET /primera_manos/1.xml
  def show
    @primera_mano = PrimeraMano.find(params[:id])
    colocarenlaces @primera_mano, '/primera_manos/'

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @primera_mano }
    end
  end
end
