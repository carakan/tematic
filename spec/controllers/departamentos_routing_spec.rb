require File.dirname(__FILE__) + '/../spec_helper'

describe DepartamentosController do
  describe "route generation" do

    it "should map { :controller => 'departamentos', :action => 'index' } to /departamentos" do
      route_for(:controller => "departamentos", :action => "index").should == "/departamentos"
    end
  
    it "should map { :controller => 'departamentos', :action => 'new' } to /departamentos/new" do
      route_for(:controller => "departamentos", :action => "new").should == "/departamentos/new"
    end
  
    it "should map { :controller => 'departamentos', :action => 'show', :id => 1 } to /departamentos/1" do
      route_for(:controller => "departamentos", :action => "show", :id => 1).should == "/departamentos/1"
    end
  
    it "should map { :controller => 'departamentos', :action => 'edit', :id => 1 } to /departamentos/1/edit" do
      route_for(:controller => "departamentos", :action => "edit", :id => 1).should == "/departamentos/1/edit"
    end
  
    it "should map { :controller => 'departamentos', :action => 'update', :id => 1} to /departamentos/1" do
      route_for(:controller => "departamentos", :action => "update", :id => 1).should == "/departamentos/1"
    end
  
    it "should map { :controller => 'departamentos', :action => 'destroy', :id => 1} to /departamentos/1" do
      route_for(:controller => "departamentos", :action => "destroy", :id => 1).should == "/departamentos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'departamentos', action => 'index' } from GET /departamentos" do
      params_from(:get, "/departamentos").should == {:controller => "departamentos", :action => "index"}
    end
  
    it "should generate params { :controller => 'departamentos', action => 'new' } from GET /departamentos/new" do
      params_from(:get, "/departamentos/new").should == {:controller => "departamentos", :action => "new"}
    end
  
    it "should generate params { :controller => 'departamentos', action => 'create' } from POST /departamentos" do
      params_from(:post, "/departamentos").should == {:controller => "departamentos", :action => "create"}
    end
  
    it "should generate params { :controller => 'departamentos', action => 'show', id => '1' } from GET /departamentos/1" do
      params_from(:get, "/departamentos/1").should == {:controller => "departamentos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'departamentos', action => 'edit', id => '1' } from GET /departamentos/1;edit" do
      params_from(:get, "/departamentos/1/edit").should == {:controller => "departamentos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'departamentos', action => 'update', id => '1' } from PUT /departamentos/1" do
      params_from(:put, "/departamentos/1").should == {:controller => "departamentos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'departamentos', action => 'destroy', id => '1' } from DELETE /departamentos/1" do
      params_from(:delete, "/departamentos/1").should == {:controller => "departamentos", :action => "destroy", :id => "1"}
    end
  end
end