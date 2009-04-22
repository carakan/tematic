require File.dirname(__FILE__) + '/../spec_helper'

describe AsambleistasController do
  describe "route generation" do

    it "should map { :controller => 'asambleistas', :action => 'index' } to /asambleistas" do
      route_for(:controller => "asambleistas", :action => "index").should == "/asambleistas"
    end
  
    it "should map { :controller => 'asambleistas', :action => 'new' } to /asambleistas/new" do
      route_for(:controller => "asambleistas", :action => "new").should == "/asambleistas/new"
    end
  
    it "should map { :controller => 'asambleistas', :action => 'show', :id => 1 } to /asambleistas/1" do
      route_for(:controller => "asambleistas", :action => "show", :id => 1).should == "/asambleistas/1"
    end
  
    it "should map { :controller => 'asambleistas', :action => 'edit', :id => 1 } to /asambleistas/1/edit" do
      route_for(:controller => "asambleistas", :action => "edit", :id => 1).should == "/asambleistas/1/edit"
    end
  
    it "should map { :controller => 'asambleistas', :action => 'update', :id => 1} to /asambleistas/1" do
      route_for(:controller => "asambleistas", :action => "update", :id => 1).should == "/asambleistas/1"
    end
  
    it "should map { :controller => 'asambleistas', :action => 'destroy', :id => 1} to /asambleistas/1" do
      route_for(:controller => "asambleistas", :action => "destroy", :id => 1).should == "/asambleistas/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'asambleistas', action => 'index' } from GET /asambleistas" do
      params_from(:get, "/asambleistas").should == {:controller => "asambleistas", :action => "index"}
    end
  
    it "should generate params { :controller => 'asambleistas', action => 'new' } from GET /asambleistas/new" do
      params_from(:get, "/asambleistas/new").should == {:controller => "asambleistas", :action => "new"}
    end
  
    it "should generate params { :controller => 'asambleistas', action => 'create' } from POST /asambleistas" do
      params_from(:post, "/asambleistas").should == {:controller => "asambleistas", :action => "create"}
    end
  
    it "should generate params { :controller => 'asambleistas', action => 'show', id => '1' } from GET /asambleistas/1" do
      params_from(:get, "/asambleistas/1").should == {:controller => "asambleistas", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'asambleistas', action => 'edit', id => '1' } from GET /asambleistas/1;edit" do
      params_from(:get, "/asambleistas/1/edit").should == {:controller => "asambleistas", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'asambleistas', action => 'update', id => '1' } from PUT /asambleistas/1" do
      params_from(:put, "/asambleistas/1").should == {:controller => "asambleistas", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'asambleistas', action => 'destroy', id => '1' } from DELETE /asambleistas/1" do
      params_from(:delete, "/asambleistas/1").should == {:controller => "asambleistas", :action => "destroy", :id => "1"}
    end
  end
end