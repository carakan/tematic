require 'rubygems'
require 'gchartrb-0.8/lib/google_chart'
class Admin::InformesController < ApplicationController
  layout 'admin'
  require_role "administrador"
  
  def index
    redirect_to('/admin/informes/usuarios')
  end
  
  def usuarios
    @data = EstadisticaUsuario.count(:group => :fecha, :limit => 12, :order => 'fecha DESC')
    
    @pie_chart = GoogleChart::LineChart.new('800x250', "Ingresos de usuarios", false) do |chart|
      chart.data 'Usuarios', @data.collect { |x| x[1] }.reverse , '00ff00'
      chart.axis :x, :labels => @data.collect { |x| x[0].to_s(:date) }.reverse, :color => '000000'
    end
    respond_to do |format|
      format.html # index.html.erb
      format.print  { render :action => 'usuarios.html.erb', :layout => "imprimir"}
    end
  end
  
  def mensual
    if params[:format] == 'print'
      @usuarios = EstadisticaUsuario.find(:all, :conditions => ["fecha = ?", params[:fecha]], :include => :user, :order => 'dbm_estadistica_usuarios.total DESC')
    else
      @usuarios = EstadisticaUsuario.paginate(:per_page => 20, :page => params[:page], :conditions => ["fecha = ?", params[:fecha]], :include => :user, :order => 'dbm_estadistica_usuarios.total DESC')
    end
    respond_to do |format|
      format.html # index.html.erb
      format.print  { render :action => 'mensual.html.erb', :layout => "imprimir"}
    end
  end
  
  def profesiones
    @data = EstadisticaUsuario.contador_profesiones(params[:fecha].to_date)
    
    @pie_chart = GoogleChart::PieChart.new('800x350', "Ingresos de usuarios por profesion", false) do |chart|
      @data.each do |row| 
        chart.data "#{row.profesionn} (#{row.contador})", row.contador.to_i, '00F'
      end 
    end
    respond_to do |format|
      format.html # index.html.erb
      format.print  { render :action => 'profesiones.html.erb', :layout => "imprimir"}
    end
  end
end
