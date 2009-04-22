require File.dirname(__FILE__) + '/../spec_helper'

describe ForosController do
  describe "route generation" do

    it "should map { :controller => 'foros', :action => 'index' } to /foros" do
      route_for(:controller => "foros", :action => "index").should == "/foros"
    end
  
    it "should map { :controller => 'foros', :action => 'new' } to /foros/new" do
      route_for(:controller => "foros", :action => "new").should == "/foros/new"
    end
  
    it "should map { :controller => 'foros', :action => 'show', :id => 1 } to /foros/1" do
      route_for(:controller => "foros", :action => "show", :id => 1).should == "/foros/1"
    end
  
    it "should map { :controller => 'foros', :action => 'edit', :id => 1 } to /foros/1/edit" do
      route_for(:controller => "foros", :action => "edit", :id => 1).should == "/foros/1/edit"
    end
  
    it "should map { :controller => 'foros', :action => 'update', :id => 1} to /foros/1" do
      route_for(:controller => "foros", :action => "update", :id => 1).should == "/foros/1"
    end
  
    it "should map { :controller => 'foros', :action => 'destroy', :id => 1} to /foros/1" do
      route_for(:controller => "foros", :action => "destroy", :id => 1).should == "/foros/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'foros', action => 'index' } from GET /foros" do
      params_from(:get, "/foros").should == {:controller => "foros", :action => "index"}
    end
  
    it "should generate params { :controller => 'foros', action => 'new' } from GET /foros/new" do
      params_from(:get, "/foros/new").should == {:controller => "foros", :action => "new"}
    end
  
    it "should generate params { :controller => 'foros', action => 'create' } from POST /foros" do
      params_from(:post, "/foros").should == {:controller => "foros", :action => "create"}
    end
  
    it "should generate params { :controller => 'foros', action => 'show', id => '1' } from GET /foros/1" do
      params_from(:get, "/foros/1").should == {:controller => "foros", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'foros', action => 'edit', id => '1' } from GET /foros/1;edit" do
      params_from(:get, "/foros/1/edit").should == {:controller => "foros", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'foros', action => 'update', id => '1' } from PUT /foros/1" do
      params_from(:put, "/foros/1").should == {:controller => "foros", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'foros', action => 'destroy', id => '1' } from DELETE /foros/1" do
      params_from(:delete, "/foros/1").should == {:controller => "foros", :action => "destroy", :id => "1"}
    end
  end
end