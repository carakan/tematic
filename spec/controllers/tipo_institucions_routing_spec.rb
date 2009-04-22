require File.dirname(__FILE__) + '/../spec_helper'

describe TipoInstitucionsController do
  describe "route generation" do

    it "should map { :controller => 'tipo_institucions', :action => 'index' } to /tipo_institucions" do
      route_for(:controller => "tipo_institucions", :action => "index").should == "/tipo_institucions"
    end
  
    it "should map { :controller => 'tipo_institucions', :action => 'new' } to /tipo_institucions/new" do
      route_for(:controller => "tipo_institucions", :action => "new").should == "/tipo_institucions/new"
    end
  
    it "should map { :controller => 'tipo_institucions', :action => 'show', :id => 1 } to /tipo_institucions/1" do
      route_for(:controller => "tipo_institucions", :action => "show", :id => 1).should == "/tipo_institucions/1"
    end
  
    it "should map { :controller => 'tipo_institucions', :action => 'edit', :id => 1 } to /tipo_institucions/1/edit" do
      route_for(:controller => "tipo_institucions", :action => "edit", :id => 1).should == "/tipo_institucions/1/edit"
    end
  
    it "should map { :controller => 'tipo_institucions', :action => 'update', :id => 1} to /tipo_institucions/1" do
      route_for(:controller => "tipo_institucions", :action => "update", :id => 1).should == "/tipo_institucions/1"
    end
  
    it "should map { :controller => 'tipo_institucions', :action => 'destroy', :id => 1} to /tipo_institucions/1" do
      route_for(:controller => "tipo_institucions", :action => "destroy", :id => 1).should == "/tipo_institucions/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'tipo_institucions', action => 'index' } from GET /tipo_institucions" do
      params_from(:get, "/tipo_institucions").should == {:controller => "tipo_institucions", :action => "index"}
    end
  
    it "should generate params { :controller => 'tipo_institucions', action => 'new' } from GET /tipo_institucions/new" do
      params_from(:get, "/tipo_institucions/new").should == {:controller => "tipo_institucions", :action => "new"}
    end
  
    it "should generate params { :controller => 'tipo_institucions', action => 'create' } from POST /tipo_institucions" do
      params_from(:post, "/tipo_institucions").should == {:controller => "tipo_institucions", :action => "create"}
    end
  
    it "should generate params { :controller => 'tipo_institucions', action => 'show', id => '1' } from GET /tipo_institucions/1" do
      params_from(:get, "/tipo_institucions/1").should == {:controller => "tipo_institucions", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'tipo_institucions', action => 'edit', id => '1' } from GET /tipo_institucions/1;edit" do
      params_from(:get, "/tipo_institucions/1/edit").should == {:controller => "tipo_institucions", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'tipo_institucions', action => 'update', id => '1' } from PUT /tipo_institucions/1" do
      params_from(:put, "/tipo_institucions/1").should == {:controller => "tipo_institucions", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'tipo_institucions', action => 'destroy', id => '1' } from DELETE /tipo_institucions/1" do
      params_from(:delete, "/tipo_institucions/1").should == {:controller => "tipo_institucions", :action => "destroy", :id => "1"}
    end
  end
end