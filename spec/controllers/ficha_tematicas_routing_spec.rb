require File.dirname(__FILE__) + '/../spec_helper'

describe FichaTematicasController do
  describe "route generation" do

    it "should map { :controller => 'ficha_tematicas', :action => 'index' } to /ficha_tematicas" do
      route_for(:controller => "ficha_tematicas", :action => "index").should == "/ficha_tematicas"
    end
  
    it "should map { :controller => 'ficha_tematicas', :action => 'new' } to /ficha_tematicas/new" do
      route_for(:controller => "ficha_tematicas", :action => "new").should == "/ficha_tematicas/new"
    end
  
    it "should map { :controller => 'ficha_tematicas', :action => 'show', :id => 1 } to /ficha_tematicas/1" do
      route_for(:controller => "ficha_tematicas", :action => "show", :id => 1).should == "/ficha_tematicas/1"
    end
  
    it "should map { :controller => 'ficha_tematicas', :action => 'edit', :id => 1 } to /ficha_tematicas/1/edit" do
      route_for(:controller => "ficha_tematicas", :action => "edit", :id => 1).should == "/ficha_tematicas/1/edit"
    end
  
    it "should map { :controller => 'ficha_tematicas', :action => 'update', :id => 1} to /ficha_tematicas/1" do
      route_for(:controller => "ficha_tematicas", :action => "update", :id => 1).should == "/ficha_tematicas/1"
    end
  
    it "should map { :controller => 'ficha_tematicas', :action => 'destroy', :id => 1} to /ficha_tematicas/1" do
      route_for(:controller => "ficha_tematicas", :action => "destroy", :id => 1).should == "/ficha_tematicas/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'ficha_tematicas', action => 'index' } from GET /ficha_tematicas" do
      params_from(:get, "/ficha_tematicas").should == {:controller => "ficha_tematicas", :action => "index"}
    end
  
    it "should generate params { :controller => 'ficha_tematicas', action => 'new' } from GET /ficha_tematicas/new" do
      params_from(:get, "/ficha_tematicas/new").should == {:controller => "ficha_tematicas", :action => "new"}
    end
  
    it "should generate params { :controller => 'ficha_tematicas', action => 'create' } from POST /ficha_tematicas" do
      params_from(:post, "/ficha_tematicas").should == {:controller => "ficha_tematicas", :action => "create"}
    end
  
    it "should generate params { :controller => 'ficha_tematicas', action => 'show', id => '1' } from GET /ficha_tematicas/1" do
      params_from(:get, "/ficha_tematicas/1").should == {:controller => "ficha_tematicas", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'ficha_tematicas', action => 'edit', id => '1' } from GET /ficha_tematicas/1;edit" do
      params_from(:get, "/ficha_tematicas/1/edit").should == {:controller => "ficha_tematicas", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'ficha_tematicas', action => 'update', id => '1' } from PUT /ficha_tematicas/1" do
      params_from(:put, "/ficha_tematicas/1").should == {:controller => "ficha_tematicas", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'ficha_tematicas', action => 'destroy', id => '1' } from DELETE /ficha_tematicas/1" do
      params_from(:delete, "/ficha_tematicas/1").should == {:controller => "ficha_tematicas", :action => "destroy", :id => "1"}
    end
  end
end