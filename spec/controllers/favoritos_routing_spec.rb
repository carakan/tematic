require File.dirname(__FILE__) + '/../spec_helper'

describe FavoritosController do
  describe "route generation" do

    it "should map { :controller => 'favoritos', :action => 'index' } to /favoritos" do
      route_for(:controller => "favoritos", :action => "index").should == "/favoritos"
    end
  
    it "should map { :controller => 'favoritos', :action => 'new' } to /favoritos/new" do
      route_for(:controller => "favoritos", :action => "new").should == "/favoritos/new"
    end
  
    it "should map { :controller => 'favoritos', :action => 'show', :id => 1 } to /favoritos/1" do
      route_for(:controller => "favoritos", :action => "show", :id => 1).should == "/favoritos/1"
    end
  
    it "should map { :controller => 'favoritos', :action => 'edit', :id => 1 } to /favoritos/1/edit" do
      route_for(:controller => "favoritos", :action => "edit", :id => 1).should == "/favoritos/1/edit"
    end
  
    it "should map { :controller => 'favoritos', :action => 'update', :id => 1} to /favoritos/1" do
      route_for(:controller => "favoritos", :action => "update", :id => 1).should == "/favoritos/1"
    end
  
    it "should map { :controller => 'favoritos', :action => 'destroy', :id => 1} to /favoritos/1" do
      route_for(:controller => "favoritos", :action => "destroy", :id => 1).should == "/favoritos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'favoritos', action => 'index' } from GET /favoritos" do
      params_from(:get, "/favoritos").should == {:controller => "favoritos", :action => "index"}
    end
  
    it "should generate params { :controller => 'favoritos', action => 'new' } from GET /favoritos/new" do
      params_from(:get, "/favoritos/new").should == {:controller => "favoritos", :action => "new"}
    end
  
    it "should generate params { :controller => 'favoritos', action => 'create' } from POST /favoritos" do
      params_from(:post, "/favoritos").should == {:controller => "favoritos", :action => "create"}
    end
  
    it "should generate params { :controller => 'favoritos', action => 'show', id => '1' } from GET /favoritos/1" do
      params_from(:get, "/favoritos/1").should == {:controller => "favoritos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'favoritos', action => 'edit', id => '1' } from GET /favoritos/1;edit" do
      params_from(:get, "/favoritos/1/edit").should == {:controller => "favoritos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'favoritos', action => 'update', id => '1' } from PUT /favoritos/1" do
      params_from(:put, "/favoritos/1").should == {:controller => "favoritos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'favoritos', action => 'destroy', id => '1' } from DELETE /favoritos/1" do
      params_from(:delete, "/favoritos/1").should == {:controller => "favoritos", :action => "destroy", :id => "1"}
    end
  end
end