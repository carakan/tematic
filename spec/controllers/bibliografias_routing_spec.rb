require File.dirname(__FILE__) + '/../spec_helper'

describe BibliografiasController do
  describe "route generation" do

    it "should map { :controller => 'bibliografias', :action => 'index' } to /bibliografias" do
      route_for(:controller => "bibliografias", :action => "index").should == "/bibliografias"
    end
  
    it "should map { :controller => 'bibliografias', :action => 'new' } to /bibliografias/new" do
      route_for(:controller => "bibliografias", :action => "new").should == "/bibliografias/new"
    end
  
    it "should map { :controller => 'bibliografias', :action => 'show', :id => 1 } to /bibliografias/1" do
      route_for(:controller => "bibliografias", :action => "show", :id => 1).should == "/bibliografias/1"
    end
  
    it "should map { :controller => 'bibliografias', :action => 'edit', :id => 1 } to /bibliografias/1/edit" do
      route_for(:controller => "bibliografias", :action => "edit", :id => 1).should == "/bibliografias/1/edit"
    end
  
    it "should map { :controller => 'bibliografias', :action => 'update', :id => 1} to /bibliografias/1" do
      route_for(:controller => "bibliografias", :action => "update", :id => 1).should == "/bibliografias/1"
    end
  
    it "should map { :controller => 'bibliografias', :action => 'destroy', :id => 1} to /bibliografias/1" do
      route_for(:controller => "bibliografias", :action => "destroy", :id => 1).should == "/bibliografias/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'bibliografias', action => 'index' } from GET /bibliografias" do
      params_from(:get, "/bibliografias").should == {:controller => "bibliografias", :action => "index"}
    end
  
    it "should generate params { :controller => 'bibliografias', action => 'new' } from GET /bibliografias/new" do
      params_from(:get, "/bibliografias/new").should == {:controller => "bibliografias", :action => "new"}
    end
  
    it "should generate params { :controller => 'bibliografias', action => 'create' } from POST /bibliografias" do
      params_from(:post, "/bibliografias").should == {:controller => "bibliografias", :action => "create"}
    end
  
    it "should generate params { :controller => 'bibliografias', action => 'show', id => '1' } from GET /bibliografias/1" do
      params_from(:get, "/bibliografias/1").should == {:controller => "bibliografias", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'bibliografias', action => 'edit', id => '1' } from GET /bibliografias/1;edit" do
      params_from(:get, "/bibliografias/1/edit").should == {:controller => "bibliografias", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'bibliografias', action => 'update', id => '1' } from PUT /bibliografias/1" do
      params_from(:put, "/bibliografias/1").should == {:controller => "bibliografias", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'bibliografias', action => 'destroy', id => '1' } from DELETE /bibliografias/1" do
      params_from(:delete, "/bibliografias/1").should == {:controller => "bibliografias", :action => "destroy", :id => "1"}
    end
  end
end