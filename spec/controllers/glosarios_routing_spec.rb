require File.dirname(__FILE__) + '/../spec_helper'

describe GlosariosController do
  describe "route generation" do

    it "should map { :controller => 'glosarios', :action => 'index' } to /glosarios" do
      route_for(:controller => "glosarios", :action => "index").should == "/glosarios"
    end
  
    it "should map { :controller => 'glosarios', :action => 'new' } to /glosarios/new" do
      route_for(:controller => "glosarios", :action => "new").should == "/glosarios/new"
    end
  
    it "should map { :controller => 'glosarios', :action => 'show', :id => 1 } to /glosarios/1" do
      route_for(:controller => "glosarios", :action => "show", :id => 1).should == "/glosarios/1"
    end
  
    it "should map { :controller => 'glosarios', :action => 'edit', :id => 1 } to /glosarios/1/edit" do
      route_for(:controller => "glosarios", :action => "edit", :id => 1).should == "/glosarios/1/edit"
    end
  
    it "should map { :controller => 'glosarios', :action => 'update', :id => 1} to /glosarios/1" do
      route_for(:controller => "glosarios", :action => "update", :id => 1).should == "/glosarios/1"
    end
  
    it "should map { :controller => 'glosarios', :action => 'destroy', :id => 1} to /glosarios/1" do
      route_for(:controller => "glosarios", :action => "destroy", :id => 1).should == "/glosarios/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'glosarios', action => 'index' } from GET /glosarios" do
      params_from(:get, "/glosarios").should == {:controller => "glosarios", :action => "index"}
    end
  
    it "should generate params { :controller => 'glosarios', action => 'new' } from GET /glosarios/new" do
      params_from(:get, "/glosarios/new").should == {:controller => "glosarios", :action => "new"}
    end
  
    it "should generate params { :controller => 'glosarios', action => 'create' } from POST /glosarios" do
      params_from(:post, "/glosarios").should == {:controller => "glosarios", :action => "create"}
    end
  
    it "should generate params { :controller => 'glosarios', action => 'show', id => '1' } from GET /glosarios/1" do
      params_from(:get, "/glosarios/1").should == {:controller => "glosarios", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'glosarios', action => 'edit', id => '1' } from GET /glosarios/1;edit" do
      params_from(:get, "/glosarios/1/edit").should == {:controller => "glosarios", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'glosarios', action => 'update', id => '1' } from PUT /glosarios/1" do
      params_from(:put, "/glosarios/1").should == {:controller => "glosarios", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'glosarios', action => 'destroy', id => '1' } from DELETE /glosarios/1" do
      params_from(:delete, "/glosarios/1").should == {:controller => "glosarios", :action => "destroy", :id => "1"}
    end
  end
end