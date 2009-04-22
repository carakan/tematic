require File.dirname(__FILE__) + '/../spec_helper'

describe InstitucionsController do
  describe "route generation" do

    it "should map { :controller => 'institucions', :action => 'index' } to /institucions" do
      route_for(:controller => "institucions", :action => "index").should == "/institucions"
    end
  
    it "should map { :controller => 'institucions', :action => 'new' } to /institucions/new" do
      route_for(:controller => "institucions", :action => "new").should == "/institucions/new"
    end
  
    it "should map { :controller => 'institucions', :action => 'show', :id => 1 } to /institucions/1" do
      route_for(:controller => "institucions", :action => "show", :id => 1).should == "/institucions/1"
    end
  
    it "should map { :controller => 'institucions', :action => 'edit', :id => 1 } to /institucions/1/edit" do
      route_for(:controller => "institucions", :action => "edit", :id => 1).should == "/institucions/1/edit"
    end
  
    it "should map { :controller => 'institucions', :action => 'update', :id => 1} to /institucions/1" do
      route_for(:controller => "institucions", :action => "update", :id => 1).should == "/institucions/1"
    end
  
    it "should map { :controller => 'institucions', :action => 'destroy', :id => 1} to /institucions/1" do
      route_for(:controller => "institucions", :action => "destroy", :id => 1).should == "/institucions/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'institucions', action => 'index' } from GET /institucions" do
      params_from(:get, "/institucions").should == {:controller => "institucions", :action => "index"}
    end
  
    it "should generate params { :controller => 'institucions', action => 'new' } from GET /institucions/new" do
      params_from(:get, "/institucions/new").should == {:controller => "institucions", :action => "new"}
    end
  
    it "should generate params { :controller => 'institucions', action => 'create' } from POST /institucions" do
      params_from(:post, "/institucions").should == {:controller => "institucions", :action => "create"}
    end
  
    it "should generate params { :controller => 'institucions', action => 'show', id => '1' } from GET /institucions/1" do
      params_from(:get, "/institucions/1").should == {:controller => "institucions", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'institucions', action => 'edit', id => '1' } from GET /institucions/1;edit" do
      params_from(:get, "/institucions/1/edit").should == {:controller => "institucions", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'institucions', action => 'update', id => '1' } from PUT /institucions/1" do
      params_from(:put, "/institucions/1").should == {:controller => "institucions", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'institucions', action => 'destroy', id => '1' } from DELETE /institucions/1" do
      params_from(:delete, "/institucions/1").should == {:controller => "institucions", :action => "destroy", :id => "1"}
    end
  end
end