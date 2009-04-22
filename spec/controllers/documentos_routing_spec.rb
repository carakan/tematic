require File.dirname(__FILE__) + '/../spec_helper'

describe DocumentosController do
  describe "route generation" do

    it "should map { :controller => 'documentos', :action => 'index' } to /documentos" do
      route_for(:controller => "documentos", :action => "index").should == "/documentos"
    end
  
    it "should map { :controller => 'documentos', :action => 'new' } to /documentos/new" do
      route_for(:controller => "documentos", :action => "new").should == "/documentos/new"
    end
  
    it "should map { :controller => 'documentos', :action => 'show', :id => 1 } to /documentos/1" do
      route_for(:controller => "documentos", :action => "show", :id => 1).should == "/documentos/1"
    end
  
    it "should map { :controller => 'documentos', :action => 'edit', :id => 1 } to /documentos/1/edit" do
      route_for(:controller => "documentos", :action => "edit", :id => 1).should == "/documentos/1/edit"
    end
  
    it "should map { :controller => 'documentos', :action => 'update', :id => 1} to /documentos/1" do
      route_for(:controller => "documentos", :action => "update", :id => 1).should == "/documentos/1"
    end
  
    it "should map { :controller => 'documentos', :action => 'destroy', :id => 1} to /documentos/1" do
      route_for(:controller => "documentos", :action => "destroy", :id => 1).should == "/documentos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'documentos', action => 'index' } from GET /documentos" do
      params_from(:get, "/documentos").should == {:controller => "documentos", :action => "index"}
    end
  
    it "should generate params { :controller => 'documentos', action => 'new' } from GET /documentos/new" do
      params_from(:get, "/documentos/new").should == {:controller => "documentos", :action => "new"}
    end
  
    it "should generate params { :controller => 'documentos', action => 'create' } from POST /documentos" do
      params_from(:post, "/documentos").should == {:controller => "documentos", :action => "create"}
    end
  
    it "should generate params { :controller => 'documentos', action => 'show', id => '1' } from GET /documentos/1" do
      params_from(:get, "/documentos/1").should == {:controller => "documentos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'documentos', action => 'edit', id => '1' } from GET /documentos/1;edit" do
      params_from(:get, "/documentos/1/edit").should == {:controller => "documentos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'documentos', action => 'update', id => '1' } from PUT /documentos/1" do
      params_from(:put, "/documentos/1").should == {:controller => "documentos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'documentos', action => 'destroy', id => '1' } from DELETE /documentos/1" do
      params_from(:delete, "/documentos/1").should == {:controller => "documentos", :action => "destroy", :id => "1"}
    end
  end
end