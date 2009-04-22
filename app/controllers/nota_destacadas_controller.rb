class NotaDestacadasController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
  # GET /nota_destacadas
  # GET /nota_destacadas.xml
  def index
    if params[:busqueda].nil?
      @nota_destacadas = NotaDestacada.paginate(:per_page => 10, :page =>params[:page], :order => 'created_at DESC')    
    else
      @nota_destacadas = NotaDestacada.paginate(:per_page => 10, :page =>params[:page], :order => 'created_at DESC', :conditions => ["titulo LIKE ? OR resumen LIKE ?", '%' + params[:busqueda] + '%', '%' + params[:busqueda] + '%'])    
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nota_destacadas }
      format.rss { render :rss => 'index', :layout => false }
    end
  end

  # GET /nota_destacadas/1
  # GET /nota_destacadas/1.xml
  def show
    @nota_destacada = NotaDestacada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nota_destacada }
    end
  end
end
