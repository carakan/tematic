require File.dirname(__FILE__) + '/../spec_helper'

describe ActorsController do
  describe "route generation" do

    it "should map { :controller => 'actors', :action => 'index' } to /actors" do
      route_for(:controller => "actors", :action => "index").should == "/actors"
    end
  
    it "should map { :controller => 'actors', :action => 'new' } to /actors/new" do
      route_for(:controller => "actors", :action => "new").should == "/actors/new"
    end
  
    it "should map { :controller => 'actors', :action => 'show', :id => 1 } to /actors/1" do
      route_for(:controller => "actors", :action => "show", :id => 1).should == "/actors/1"
    end
  
    it "should map { :controller => 'actors', :action => 'edit', :id => 1 } to /actors/1/edit" do
      route_for(:controller => "actors", :action => "edit", :id => 1).should == "/actors/1/edit"
    end
  
    it "should map { :controller => 'actors', :action => 'update', :id => 1} to /actors/1" do
      route_for(:controller => "actors", :action => "update", :id => 1).should == "/actors/1"
    end
  
    it "should map { :controller => 'actors', :action => 'destroy', :id => 1} to /actors/1" do
      route_for(:controller => "actors", :action => "destroy", :id => 1).should == "/actors/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'actors', action => 'index' } from GET /actors" do
      params_from(:get, "/actors").should == {:controller => "actors", :action => "index"}
    end
  
    it "should generate params { :controller => 'actors', action => 'new' } from GET /actors/new" do
      params_from(:get, "/actors/new").should == {:controller => "actors", :action => "new"}
    end
  
    it "should generate params { :controller => 'actors', action => 'create' } from POST /actors" do
      params_from(:post, "/actors").should == {:controller => "actors", :action => "create"}
    end
  
    it "should generate params { :controller => 'actors', action => 'show', id => '1' } from GET /actors/1" do
      params_from(:get, "/actors/1").should == {:controller => "actors", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'actors', action => 'edit', id => '1' } from GET /actors/1;edit" do
      params_from(:get, "/actors/1/edit").should == {:controller => "actors", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'actors', action => 'update', id => '1' } from PUT /actors/1" do
      params_from(:put, "/actors/1").should == {:controller => "actors", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'actors', action => 'destroy', id => '1' } from DELETE /actors/1" do
      params_from(:delete, "/actors/1").should == {:controller => "actors", :action => "destroy", :id => "1"}
    end
  end
end