require File.dirname(__FILE__) + '/../spec_helper'

describe ValorNoticiasController do
  describe "route generation" do

    it "should map { :controller => 'valor_noticias', :action => 'index' } to /valor_noticias" do
      route_for(:controller => "valor_noticias", :action => "index").should == "/valor_noticias"
    end
  
    it "should map { :controller => 'valor_noticias', :action => 'new' } to /valor_noticias/new" do
      route_for(:controller => "valor_noticias", :action => "new").should == "/valor_noticias/new"
    end
  
    it "should map { :controller => 'valor_noticias', :action => 'show', :id => 1 } to /valor_noticias/1" do
      route_for(:controller => "valor_noticias", :action => "show", :id => 1).should == "/valor_noticias/1"
    end
  
    it "should map { :controller => 'valor_noticias', :action => 'edit', :id => 1 } to /valor_noticias/1/edit" do
      route_for(:controller => "valor_noticias", :action => "edit", :id => 1).should == "/valor_noticias/1/edit"
    end
  
    it "should map { :controller => 'valor_noticias', :action => 'update', :id => 1} to /valor_noticias/1" do
      route_for(:controller => "valor_noticias", :action => "update", :id => 1).should == "/valor_noticias/1"
    end
  
    it "should map { :controller => 'valor_noticias', :action => 'destroy', :id => 1} to /valor_noticias/1" do
      route_for(:controller => "valor_noticias", :action => "destroy", :id => 1).should == "/valor_noticias/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'valor_noticias', action => 'index' } from GET /valor_noticias" do
      params_from(:get, "/valor_noticias").should == {:controller => "valor_noticias", :action => "index"}
    end
  
    it "should generate params { :controller => 'valor_noticias', action => 'new' } from GET /valor_noticias/new" do
      params_from(:get, "/valor_noticias/new").should == {:controller => "valor_noticias", :action => "new"}
    end
  
    it "should generate params { :controller => 'valor_noticias', action => 'create' } from POST /valor_noticias" do
      params_from(:post, "/valor_noticias").should == {:controller => "valor_noticias", :action => "create"}
    end
  
    it "should generate params { :controller => 'valor_noticias', action => 'show', id => '1' } from GET /valor_noticias/1" do
      params_from(:get, "/valor_noticias/1").should == {:controller => "valor_noticias", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'valor_noticias', action => 'edit', id => '1' } from GET /valor_noticias/1;edit" do
      params_from(:get, "/valor_noticias/1/edit").should == {:controller => "valor_noticias", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'valor_noticias', action => 'update', id => '1' } from PUT /valor_noticias/1" do
      params_from(:put, "/valor_noticias/1").should == {:controller => "valor_noticias", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'valor_noticias', action => 'destroy', id => '1' } from DELETE /valor_noticias/1" do
      params_from(:delete, "/valor_noticias/1").should == {:controller => "valor_noticias", :action => "destroy", :id => "1"}
    end
  end
end