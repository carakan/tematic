require File.dirname(__FILE__) + '/../spec_helper'

describe NotaDestacadasController do
  describe "route generation" do

    it "should map { :controller => 'nota_destacadas', :action => 'index' } to /nota_destacadas" do
      route_for(:controller => "nota_destacadas", :action => "index").should == "/nota_destacadas"
    end
  
    it "should map { :controller => 'nota_destacadas', :action => 'new' } to /nota_destacadas/new" do
      route_for(:controller => "nota_destacadas", :action => "new").should == "/nota_destacadas/new"
    end
  
    it "should map { :controller => 'nota_destacadas', :action => 'show', :id => 1 } to /nota_destacadas/1" do
      route_for(:controller => "nota_destacadas", :action => "show", :id => 1).should == "/nota_destacadas/1"
    end
  
    it "should map { :controller => 'nota_destacadas', :action => 'edit', :id => 1 } to /nota_destacadas/1/edit" do
      route_for(:controller => "nota_destacadas", :action => "edit", :id => 1).should == "/nota_destacadas/1/edit"
    end
  
    it "should map { :controller => 'nota_destacadas', :action => 'update', :id => 1} to /nota_destacadas/1" do
      route_for(:controller => "nota_destacadas", :action => "update", :id => 1).should == "/nota_destacadas/1"
    end
  
    it "should map { :controller => 'nota_destacadas', :action => 'destroy', :id => 1} to /nota_destacadas/1" do
      route_for(:controller => "nota_destacadas", :action => "destroy", :id => 1).should == "/nota_destacadas/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'nota_destacadas', action => 'index' } from GET /nota_destacadas" do
      params_from(:get, "/nota_destacadas").should == {:controller => "nota_destacadas", :action => "index"}
    end
  
    it "should generate params { :controller => 'nota_destacadas', action => 'new' } from GET /nota_destacadas/new" do
      params_from(:get, "/nota_destacadas/new").should == {:controller => "nota_destacadas", :action => "new"}
    end
  
    it "should generate params { :controller => 'nota_destacadas', action => 'create' } from POST /nota_destacadas" do
      params_from(:post, "/nota_destacadas").should == {:controller => "nota_destacadas", :action => "create"}
    end
  
    it "should generate params { :controller => 'nota_destacadas', action => 'show', id => '1' } from GET /nota_destacadas/1" do
      params_from(:get, "/nota_destacadas/1").should == {:controller => "nota_destacadas", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'nota_destacadas', action => 'edit', id => '1' } from GET /nota_destacadas/1;edit" do
      params_from(:get, "/nota_destacadas/1/edit").should == {:controller => "nota_destacadas", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'nota_destacadas', action => 'update', id => '1' } from PUT /nota_destacadas/1" do
      params_from(:put, "/nota_destacadas/1").should == {:controller => "nota_destacadas", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'nota_destacadas', action => 'destroy', id => '1' } from DELETE /nota_destacadas/1" do
      params_from(:delete, "/nota_destacadas/1").should == {:controller => "nota_destacadas", :action => "destroy", :id => "1"}
    end
  end
end