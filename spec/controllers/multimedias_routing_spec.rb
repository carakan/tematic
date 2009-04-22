require File.dirname(__FILE__) + '/../spec_helper'

describe MultimediasController do
  describe "route generation" do

    it "should map { :controller => 'multimedias', :action => 'index' } to /multimedias" do
      route_for(:controller => "multimedias", :action => "index").should == "/multimedias"
    end
  
    it "should map { :controller => 'multimedias', :action => 'new' } to /multimedias/new" do
      route_for(:controller => "multimedias", :action => "new").should == "/multimedias/new"
    end
  
    it "should map { :controller => 'multimedias', :action => 'show', :id => 1 } to /multimedias/1" do
      route_for(:controller => "multimedias", :action => "show", :id => 1).should == "/multimedias/1"
    end
  
    it "should map { :controller => 'multimedias', :action => 'edit', :id => 1 } to /multimedias/1/edit" do
      route_for(:controller => "multimedias", :action => "edit", :id => 1).should == "/multimedias/1/edit"
    end
  
    it "should map { :controller => 'multimedias', :action => 'update', :id => 1} to /multimedias/1" do
      route_for(:controller => "multimedias", :action => "update", :id => 1).should == "/multimedias/1"
    end
  
    it "should map { :controller => 'multimedias', :action => 'destroy', :id => 1} to /multimedias/1" do
      route_for(:controller => "multimedias", :action => "destroy", :id => 1).should == "/multimedias/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'multimedias', action => 'index' } from GET /multimedias" do
      params_from(:get, "/multimedias").should == {:controller => "multimedias", :action => "index"}
    end
  
    it "should generate params { :controller => 'multimedias', action => 'new' } from GET /multimedias/new" do
      params_from(:get, "/multimedias/new").should == {:controller => "multimedias", :action => "new"}
    end
  
    it "should generate params { :controller => 'multimedias', action => 'create' } from POST /multimedias" do
      params_from(:post, "/multimedias").should == {:controller => "multimedias", :action => "create"}
    end
  
    it "should generate params { :controller => 'multimedias', action => 'show', id => '1' } from GET /multimedias/1" do
      params_from(:get, "/multimedias/1").should == {:controller => "multimedias", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'multimedias', action => 'edit', id => '1' } from GET /multimedias/1;edit" do
      params_from(:get, "/multimedias/1/edit").should == {:controller => "multimedias", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'multimedias', action => 'update', id => '1' } from PUT /multimedias/1" do
      params_from(:put, "/multimedias/1").should == {:controller => "multimedias", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'multimedias', action => 'destroy', id => '1' } from DELETE /multimedias/1" do
      params_from(:delete, "/multimedias/1").should == {:controller => "multimedias", :action => "destroy", :id => "1"}
    end
  end
end