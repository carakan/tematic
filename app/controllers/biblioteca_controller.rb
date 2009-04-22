class BibliotecaController < ApplicationController
  layout 'login'

  def index
    @bibliotecas
  end
  
  def documentos
    @documentos = Documento.busqueda(params[:page], params[:descriptor], params[:busqueda])  
  end
  
  def fichas_tematicas
    @fichas = FichaTematica.busqueda(params[:page], params[:descriptor], params[:busqueda])
  end
  
  def bibliografia
    @bibliografias = Bibliografia.busqueda(params[:page], params[:descriptor], params[:busqueda])
    end
  
  def legislacion
    @legislaciones = Legislacion.busqueda(params[:page], params[:descriptor], params[:busqueda])
    end
  
  def glosario
    @glosarios = Glosario.busqueda(params[:page], params[:descriptor], params[:busqueda])
    end
  
  def valor_noticia
    if params[:id].nil?
      @valores = ValorNoticia.busqueda(params[:page], params[:descriptor], params[:busqueda])
    else
      @valor = ValorNoticia.find(params[:id])      
      colocarenlaces @valor, '/biblioteca/valor_noticia/'    
      render :action => "show_valor" 
    end
  end
end
