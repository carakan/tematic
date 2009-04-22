require File.dirname(__FILE__) + '/../spec_helper'

describe MunicipiosController do
  describe "route generation" do

    it "should map { :controller => 'municipios', :action => 'index' } to /municipios" do
      route_for(:controller => "municipios", :action => "index").should == "/municipios"
    end
  
    it "should map { :controller => 'municipios', :action => 'new' } to /municipios/new" do
      route_for(:controller => "municipios", :action => "new").should == "/municipios/new"
    end
  
    it "should map { :controller => 'municipios', :action => 'show', :id => 1 } to /municipios/1" do
      route_for(:controller => "municipios", :action => "show", :id => 1).should == "/municipios/1"
    end
  
    it "should map { :controller => 'municipios', :action => 'edit', :id => 1 } to /municipios/1/edit" do
      route_for(:controller => "municipios", :action => "edit", :id => 1).should == "/municipios/1/edit"
    end
  
    it "should map { :controller => 'municipios', :action => 'update', :id => 1} to /municipios/1" do
      route_for(:controller => "municipios", :action => "update", :id => 1).should == "/municipios/1"
    end
  
    it "should map { :controller => 'municipios', :action => 'destroy', :id => 1} to /municipios/1" do
      route_for(:controller => "municipios", :action => "destroy", :id => 1).should == "/municipios/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'municipios', action => 'index' } from GET /municipios" do
      params_from(:get, "/municipios").should == {:controller => "municipios", :action => "index"}
    end
  
    it "should generate params { :controller => 'municipios', action => 'new' } from GET /municipios/new" do
      params_from(:get, "/municipios/new").should == {:controller => "municipios", :action => "new"}
    end
  
    it "should generate params { :controller => 'municipios', action => 'create' } from POST /municipios" do
      params_from(:post, "/municipios").should == {:controller => "municipios", :action => "create"}
    end
  
    it "should generate params { :controller => 'municipios', action => 'show', id => '1' } from GET /municipios/1" do
      params_from(:get, "/municipios/1").should == {:controller => "municipios", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'municipios', action => 'edit', id => '1' } from GET /municipios/1;edit" do
      params_from(:get, "/municipios/1/edit").should == {:controller => "municipios", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'municipios', action => 'update', id => '1' } from PUT /municipios/1" do
      params_from(:put, "/municipios/1").should == {:controller => "municipios", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'municipios', action => 'destroy', id => '1' } from DELETE /municipios/1" do
      params_from(:delete, "/municipios/1").should == {:controller => "municipios", :action => "destroy", :id => "1"}
    end
  end
end