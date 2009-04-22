require File.dirname(__FILE__) + '/../spec_helper'

describe EnlaceUrlsController do
  describe "route generation" do

    it "should map { :controller => 'enlace_urls', :action => 'index' } to /enlace_urls" do
      route_for(:controller => "enlace_urls", :action => "index").should == "/enlace_urls"
    end
  
    it "should map { :controller => 'enlace_urls', :action => 'new' } to /enlace_urls/new" do
      route_for(:controller => "enlace_urls", :action => "new").should == "/enlace_urls/new"
    end
  
    it "should map { :controller => 'enlace_urls', :action => 'show', :id => 1 } to /enlace_urls/1" do
      route_for(:controller => "enlace_urls", :action => "show", :id => 1).should == "/enlace_urls/1"
    end
  
    it "should map { :controller => 'enlace_urls', :action => 'edit', :id => 1 } to /enlace_urls/1/edit" do
      route_for(:controller => "enlace_urls", :action => "edit", :id => 1).should == "/enlace_urls/1/edit"
    end
  
    it "should map { :controller => 'enlace_urls', :action => 'update', :id => 1} to /enlace_urls/1" do
      route_for(:controller => "enlace_urls", :action => "update", :id => 1).should == "/enlace_urls/1"
    end
  
    it "should map { :controller => 'enlace_urls', :action => 'destroy', :id => 1} to /enlace_urls/1" do
      route_for(:controller => "enlace_urls", :action => "destroy", :id => 1).should == "/enlace_urls/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'enlace_urls', action => 'index' } from GET /enlace_urls" do
      params_from(:get, "/enlace_urls").should == {:controller => "enlace_urls", :action => "index"}
    end
  
    it "should generate params { :controller => 'enlace_urls', action => 'new' } from GET /enlace_urls/new" do
      params_from(:get, "/enlace_urls/new").should == {:controller => "enlace_urls", :action => "new"}
    end
  
    it "should generate params { :controller => 'enlace_urls', action => 'create' } from POST /enlace_urls" do
      params_from(:post, "/enlace_urls").should == {:controller => "enlace_urls", :action => "create"}
    end
  
    it "should generate params { :controller => 'enlace_urls', action => 'show', id => '1' } from GET /enlace_urls/1" do
      params_from(:get, "/enlace_urls/1").should == {:controller => "enlace_urls", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'enlace_urls', action => 'edit', id => '1' } from GET /enlace_urls/1;edit" do
      params_from(:get, "/enlace_urls/1/edit").should == {:controller => "enlace_urls", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'enlace_urls', action => 'update', id => '1' } from PUT /enlace_urls/1" do
      params_from(:put, "/enlace_urls/1").should == {:controller => "enlace_urls", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'enlace_urls', action => 'destroy', id => '1' } from DELETE /enlace_urls/1" do
      params_from(:delete, "/enlace_urls/1").should == {:controller => "enlace_urls", :action => "destroy", :id => "1"}
    end
  end
end