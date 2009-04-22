require File.dirname(__FILE__) + '/../spec_helper'

describe ProfesionsController do
  describe "route generation" do

    it "should map { :controller => 'profesions', :action => 'index' } to /profesions" do
      route_for(:controller => "profesions", :action => "index").should == "/profesions"
    end
  
    it "should map { :controller => 'profesions', :action => 'new' } to /profesions/new" do
      route_for(:controller => "profesions", :action => "new").should == "/profesions/new"
    end
  
    it "should map { :controller => 'profesions', :action => 'show', :id => 1 } to /profesions/1" do
      route_for(:controller => "profesions", :action => "show", :id => 1).should == "/profesions/1"
    end
  
    it "should map { :controller => 'profesions', :action => 'edit', :id => 1 } to /profesions/1/edit" do
      route_for(:controller => "profesions", :action => "edit", :id => 1).should == "/profesions/1/edit"
    end
  
    it "should map { :controller => 'profesions', :action => 'update', :id => 1} to /profesions/1" do
      route_for(:controller => "profesions", :action => "update", :id => 1).should == "/profesions/1"
    end
  
    it "should map { :controller => 'profesions', :action => 'destroy', :id => 1} to /profesions/1" do
      route_for(:controller => "profesions", :action => "destroy", :id => 1).should == "/profesions/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'profesions', action => 'index' } from GET /profesions" do
      params_from(:get, "/profesions").should == {:controller => "profesions", :action => "index"}
    end
  
    it "should generate params { :controller => 'profesions', action => 'new' } from GET /profesions/new" do
      params_from(:get, "/profesions/new").should == {:controller => "profesions", :action => "new"}
    end
  
    it "should generate params { :controller => 'profesions', action => 'create' } from POST /profesions" do
      params_from(:post, "/profesions").should == {:controller => "profesions", :action => "create"}
    end
  
    it "should generate params { :controller => 'profesions', action => 'show', id => '1' } from GET /profesions/1" do
      params_from(:get, "/profesions/1").should == {:controller => "profesions", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'profesions', action => 'edit', id => '1' } from GET /profesions/1;edit" do
      params_from(:get, "/profesions/1/edit").should == {:controller => "profesions", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'profesions', action => 'update', id => '1' } from PUT /profesions/1" do
      params_from(:put, "/profesions/1").should == {:controller => "profesions", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'profesions', action => 'destroy', id => '1' } from DELETE /profesions/1" do
      params_from(:delete, "/profesions/1").should == {:controller => "profesions", :action => "destroy", :id => "1"}
    end
  end
end