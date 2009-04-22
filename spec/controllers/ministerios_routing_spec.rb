require File.dirname(__FILE__) + '/../spec_helper'

describe MinisteriosController do
  describe "route generation" do

    it "should map { :controller => 'ministerios', :action => 'index' } to /ministerios" do
      route_for(:controller => "ministerios", :action => "index").should == "/ministerios"
    end
  
    it "should map { :controller => 'ministerios', :action => 'new' } to /ministerios/new" do
      route_for(:controller => "ministerios", :action => "new").should == "/ministerios/new"
    end
  
    it "should map { :controller => 'ministerios', :action => 'show', :id => 1 } to /ministerios/1" do
      route_for(:controller => "ministerios", :action => "show", :id => 1).should == "/ministerios/1"
    end
  
    it "should map { :controller => 'ministerios', :action => 'edit', :id => 1 } to /ministerios/1/edit" do
      route_for(:controller => "ministerios", :action => "edit", :id => 1).should == "/ministerios/1/edit"
    end
  
    it "should map { :controller => 'ministerios', :action => 'update', :id => 1} to /ministerios/1" do
      route_for(:controller => "ministerios", :action => "update", :id => 1).should == "/ministerios/1"
    end
  
    it "should map { :controller => 'ministerios', :action => 'destroy', :id => 1} to /ministerios/1" do
      route_for(:controller => "ministerios", :action => "destroy", :id => 1).should == "/ministerios/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'ministerios', action => 'index' } from GET /ministerios" do
      params_from(:get, "/ministerios").should == {:controller => "ministerios", :action => "index"}
    end
  
    it "should generate params { :controller => 'ministerios', action => 'new' } from GET /ministerios/new" do
      params_from(:get, "/ministerios/new").should == {:controller => "ministerios", :action => "new"}
    end
  
    it "should generate params { :controller => 'ministerios', action => 'create' } from POST /ministerios" do
      params_from(:post, "/ministerios").should == {:controller => "ministerios", :action => "create"}
    end
  
    it "should generate params { :controller => 'ministerios', action => 'show', id => '1' } from GET /ministerios/1" do
      params_from(:get, "/ministerios/1").should == {:controller => "ministerios", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'ministerios', action => 'edit', id => '1' } from GET /ministerios/1;edit" do
      params_from(:get, "/ministerios/1/edit").should == {:controller => "ministerios", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'ministerios', action => 'update', id => '1' } from PUT /ministerios/1" do
      params_from(:put, "/ministerios/1").should == {:controller => "ministerios", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'ministerios', action => 'destroy', id => '1' } from DELETE /ministerios/1" do
      params_from(:delete, "/ministerios/1").should == {:controller => "ministerios", :action => "destroy", :id => "1"}
    end
  end
end