require File.dirname(__FILE__) + '/../spec_helper'

describe CargosController do
  describe "route generation" do

    it "should map { :controller => 'cargos', :action => 'index' } to /cargos" do
      route_for(:controller => "cargos", :action => "index").should == "/cargos"
    end
  
    it "should map { :controller => 'cargos', :action => 'new' } to /cargos/new" do
      route_for(:controller => "cargos", :action => "new").should == "/cargos/new"
    end
  
    it "should map { :controller => 'cargos', :action => 'show', :id => 1 } to /cargos/1" do
      route_for(:controller => "cargos", :action => "show", :id => 1).should == "/cargos/1"
    end
  
    it "should map { :controller => 'cargos', :action => 'edit', :id => 1 } to /cargos/1/edit" do
      route_for(:controller => "cargos", :action => "edit", :id => 1).should == "/cargos/1/edit"
    end
  
    it "should map { :controller => 'cargos', :action => 'update', :id => 1} to /cargos/1" do
      route_for(:controller => "cargos", :action => "update", :id => 1).should == "/cargos/1"
    end
  
    it "should map { :controller => 'cargos', :action => 'destroy', :id => 1} to /cargos/1" do
      route_for(:controller => "cargos", :action => "destroy", :id => 1).should == "/cargos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'cargos', action => 'index' } from GET /cargos" do
      params_from(:get, "/cargos").should == {:controller => "cargos", :action => "index"}
    end
  
    it "should generate params { :controller => 'cargos', action => 'new' } from GET /cargos/new" do
      params_from(:get, "/cargos/new").should == {:controller => "cargos", :action => "new"}
    end
  
    it "should generate params { :controller => 'cargos', action => 'create' } from POST /cargos" do
      params_from(:post, "/cargos").should == {:controller => "cargos", :action => "create"}
    end
  
    it "should generate params { :controller => 'cargos', action => 'show', id => '1' } from GET /cargos/1" do
      params_from(:get, "/cargos/1").should == {:controller => "cargos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'cargos', action => 'edit', id => '1' } from GET /cargos/1;edit" do
      params_from(:get, "/cargos/1/edit").should == {:controller => "cargos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'cargos', action => 'update', id => '1' } from PUT /cargos/1" do
      params_from(:put, "/cargos/1").should == {:controller => "cargos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'cargos', action => 'destroy', id => '1' } from DELETE /cargos/1" do
      params_from(:delete, "/cargos/1").should == {:controller => "cargos", :action => "destroy", :id => "1"}
    end
  end
end