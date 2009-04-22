require File.dirname(__FILE__) + '/../spec_helper'

describe DocumentoInteresController do
  describe "route generation" do

    it "should map { :controller => 'documento_interes', :action => 'index' } to /documento_interes" do
      route_for(:controller => "documento_interes", :action => "index").should == "/documento_interes"
    end
  
    it "should map { :controller => 'documento_interes', :action => 'new' } to /documento_interes/new" do
      route_for(:controller => "documento_interes", :action => "new").should == "/documento_interes/new"
    end
  
    it "should map { :controller => 'documento_interes', :action => 'show', :id => 1 } to /documento_interes/1" do
      route_for(:controller => "documento_interes", :action => "show", :id => 1).should == "/documento_interes/1"
    end
  
    it "should map { :controller => 'documento_interes', :action => 'edit', :id => 1 } to /documento_interes/1/edit" do
      route_for(:controller => "documento_interes", :action => "edit", :id => 1).should == "/documento_interes/1/edit"
    end
  
    it "should map { :controller => 'documento_interes', :action => 'update', :id => 1} to /documento_interes/1" do
      route_for(:controller => "documento_interes", :action => "update", :id => 1).should == "/documento_interes/1"
    end
  
    it "should map { :controller => 'documento_interes', :action => 'destroy', :id => 1} to /documento_interes/1" do
      route_for(:controller => "documento_interes", :action => "destroy", :id => 1).should == "/documento_interes/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'documento_interes', action => 'index' } from GET /documento_interes" do
      params_from(:get, "/documento_interes").should == {:controller => "documento_interes", :action => "index"}
    end
  
    it "should generate params { :controller => 'documento_interes', action => 'new' } from GET /documento_interes/new" do
      params_from(:get, "/documento_interes/new").should == {:controller => "documento_interes", :action => "new"}
    end
  
    it "should generate params { :controller => 'documento_interes', action => 'create' } from POST /documento_interes" do
      params_from(:post, "/documento_interes").should == {:controller => "documento_interes", :action => "create"}
    end
  
    it "should generate params { :controller => 'documento_interes', action => 'show', id => '1' } from GET /documento_interes/1" do
      params_from(:get, "/documento_interes/1").should == {:controller => "documento_interes", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'documento_interes', action => 'edit', id => '1' } from GET /documento_interes/1;edit" do
      params_from(:get, "/documento_interes/1/edit").should == {:controller => "documento_interes", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'documento_interes', action => 'update', id => '1' } from PUT /documento_interes/1" do
      params_from(:put, "/documento_interes/1").should == {:controller => "documento_interes", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'documento_interes', action => 'destroy', id => '1' } from DELETE /documento_interes/1" do
      params_from(:delete, "/documento_interes/1").should == {:controller => "documento_interes", :action => "destroy", :id => "1"}
    end
  end
end