require File.dirname(__FILE__) + '/../spec_helper'

describe PosicionActorsController do
  describe "route generation" do

    it "should map { :controller => 'posicion_actors', :action => 'index' } to /posicion_actors" do
      route_for(:controller => "posicion_actors", :action => "index").should == "/posicion_actors"
    end
  
    it "should map { :controller => 'posicion_actors', :action => 'new' } to /posicion_actors/new" do
      route_for(:controller => "posicion_actors", :action => "new").should == "/posicion_actors/new"
    end
  
    it "should map { :controller => 'posicion_actors', :action => 'show', :id => 1 } to /posicion_actors/1" do
      route_for(:controller => "posicion_actors", :action => "show", :id => 1).should == "/posicion_actors/1"
    end
  
    it "should map { :controller => 'posicion_actors', :action => 'edit', :id => 1 } to /posicion_actors/1/edit" do
      route_for(:controller => "posicion_actors", :action => "edit", :id => 1).should == "/posicion_actors/1/edit"
    end
  
    it "should map { :controller => 'posicion_actors', :action => 'update', :id => 1} to /posicion_actors/1" do
      route_for(:controller => "posicion_actors", :action => "update", :id => 1).should == "/posicion_actors/1"
    end
  
    it "should map { :controller => 'posicion_actors', :action => 'destroy', :id => 1} to /posicion_actors/1" do
      route_for(:controller => "posicion_actors", :action => "destroy", :id => 1).should == "/posicion_actors/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'posicion_actors', action => 'index' } from GET /posicion_actors" do
      params_from(:get, "/posicion_actors").should == {:controller => "posicion_actors", :action => "index"}
    end
  
    it "should generate params { :controller => 'posicion_actors', action => 'new' } from GET /posicion_actors/new" do
      params_from(:get, "/posicion_actors/new").should == {:controller => "posicion_actors", :action => "new"}
    end
  
    it "should generate params { :controller => 'posicion_actors', action => 'create' } from POST /posicion_actors" do
      params_from(:post, "/posicion_actors").should == {:controller => "posicion_actors", :action => "create"}
    end
  
    it "should generate params { :controller => 'posicion_actors', action => 'show', id => '1' } from GET /posicion_actors/1" do
      params_from(:get, "/posicion_actors/1").should == {:controller => "posicion_actors", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'posicion_actors', action => 'edit', id => '1' } from GET /posicion_actors/1;edit" do
      params_from(:get, "/posicion_actors/1/edit").should == {:controller => "posicion_actors", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'posicion_actors', action => 'update', id => '1' } from PUT /posicion_actors/1" do
      params_from(:put, "/posicion_actors/1").should == {:controller => "posicion_actors", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'posicion_actors', action => 'destroy', id => '1' } from DELETE /posicion_actors/1" do
      params_from(:delete, "/posicion_actors/1").should == {:controller => "posicion_actors", :action => "destroy", :id => "1"}
    end
  end
end