require File.dirname(__FILE__) + '/../spec_helper'

describe PaisesController do
  describe "route generation" do

    it "should map { :controller => 'paises', :action => 'index' } to /paises" do
      route_for(:controller => "paises", :action => "index").should == "/paises"
    end
  
    it "should map { :controller => 'paises', :action => 'new' } to /paises/new" do
      route_for(:controller => "paises", :action => "new").should == "/paises/new"
    end
  
    it "should map { :controller => 'paises', :action => 'show', :id => 1 } to /paises/1" do
      route_for(:controller => "paises", :action => "show", :id => 1).should == "/paises/1"
    end
  
    it "should map { :controller => 'paises', :action => 'edit', :id => 1 } to /paises/1/edit" do
      route_for(:controller => "paises", :action => "edit", :id => 1).should == "/paises/1/edit"
    end
  
    it "should map { :controller => 'paises', :action => 'update', :id => 1} to /paises/1" do
      route_for(:controller => "paises", :action => "update", :id => 1).should == "/paises/1"
    end
  
    it "should map { :controller => 'paises', :action => 'destroy', :id => 1} to /paises/1" do
      route_for(:controller => "paises", :action => "destroy", :id => 1).should == "/paises/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'paises', action => 'index' } from GET /paises" do
      params_from(:get, "/paises").should == {:controller => "paises", :action => "index"}
    end
  
    it "should generate params { :controller => 'paises', action => 'new' } from GET /paises/new" do
      params_from(:get, "/paises/new").should == {:controller => "paises", :action => "new"}
    end
  
    it "should generate params { :controller => 'paises', action => 'create' } from POST /paises" do
      params_from(:post, "/paises").should == {:controller => "paises", :action => "create"}
    end
  
    it "should generate params { :controller => 'paises', action => 'show', id => '1' } from GET /paises/1" do
      params_from(:get, "/paises/1").should == {:controller => "paises", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'paises', action => 'edit', id => '1' } from GET /paises/1;edit" do
      params_from(:get, "/paises/1/edit").should == {:controller => "paises", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'paises', action => 'update', id => '1' } from PUT /paises/1" do
      params_from(:put, "/paises/1").should == {:controller => "paises", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'paises', action => 'destroy', id => '1' } from DELETE /paises/1" do
      params_from(:delete, "/paises/1").should == {:controller => "paises", :action => "destroy", :id => "1"}
    end
  end
end