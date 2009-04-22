require File.dirname(__FILE__) + '/../spec_helper'

describe ComentariosController do
  describe "route generation" do

    it "should map { :controller => 'comentarios', :action => 'index' } to /comentarios" do
      route_for(:controller => "comentarios", :action => "index").should == "/comentarios"
    end
  
    it "should map { :controller => 'comentarios', :action => 'new' } to /comentarios/new" do
      route_for(:controller => "comentarios", :action => "new").should == "/comentarios/new"
    end
  
    it "should map { :controller => 'comentarios', :action => 'show', :id => 1 } to /comentarios/1" do
      route_for(:controller => "comentarios", :action => "show", :id => 1).should == "/comentarios/1"
    end
  
    it "should map { :controller => 'comentarios', :action => 'edit', :id => 1 } to /comentarios/1/edit" do
      route_for(:controller => "comentarios", :action => "edit", :id => 1).should == "/comentarios/1/edit"
    end
  
    it "should map { :controller => 'comentarios', :action => 'update', :id => 1} to /comentarios/1" do
      route_for(:controller => "comentarios", :action => "update", :id => 1).should == "/comentarios/1"
    end
  
    it "should map { :controller => 'comentarios', :action => 'destroy', :id => 1} to /comentarios/1" do
      route_for(:controller => "comentarios", :action => "destroy", :id => 1).should == "/comentarios/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'comentarios', action => 'index' } from GET /comentarios" do
      params_from(:get, "/comentarios").should == {:controller => "comentarios", :action => "index"}
    end
  
    it "should generate params { :controller => 'comentarios', action => 'new' } from GET /comentarios/new" do
      params_from(:get, "/comentarios/new").should == {:controller => "comentarios", :action => "new"}
    end
  
    it "should generate params { :controller => 'comentarios', action => 'create' } from POST /comentarios" do
      params_from(:post, "/comentarios").should == {:controller => "comentarios", :action => "create"}
    end
  
    it "should generate params { :controller => 'comentarios', action => 'show', id => '1' } from GET /comentarios/1" do
      params_from(:get, "/comentarios/1").should == {:controller => "comentarios", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'comentarios', action => 'edit', id => '1' } from GET /comentarios/1;edit" do
      params_from(:get, "/comentarios/1/edit").should == {:controller => "comentarios", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'comentarios', action => 'update', id => '1' } from PUT /comentarios/1" do
      params_from(:put, "/comentarios/1").should == {:controller => "comentarios", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'comentarios', action => 'destroy', id => '1' } from DELETE /comentarios/1" do
      params_from(:delete, "/comentarios/1").should == {:controller => "comentarios", :action => "destroy", :id => "1"}
    end
  end
end