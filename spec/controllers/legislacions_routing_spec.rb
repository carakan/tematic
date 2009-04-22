require File.dirname(__FILE__) + '/../spec_helper'

describe LegislacionsController do
  describe "route generation" do

    it "should map { :controller => 'legislacions', :action => 'index' } to /legislacions" do
      route_for(:controller => "legislacions", :action => "index").should == "/legislacions"
    end
  
    it "should map { :controller => 'legislacions', :action => 'new' } to /legislacions/new" do
      route_for(:controller => "legislacions", :action => "new").should == "/legislacions/new"
    end
  
    it "should map { :controller => 'legislacions', :action => 'show', :id => 1 } to /legislacions/1" do
      route_for(:controller => "legislacions", :action => "show", :id => 1).should == "/legislacions/1"
    end
  
    it "should map { :controller => 'legislacions', :action => 'edit', :id => 1 } to /legislacions/1/edit" do
      route_for(:controller => "legislacions", :action => "edit", :id => 1).should == "/legislacions/1/edit"
    end
  
    it "should map { :controller => 'legislacions', :action => 'update', :id => 1} to /legislacions/1" do
      route_for(:controller => "legislacions", :action => "update", :id => 1).should == "/legislacions/1"
    end
  
    it "should map { :controller => 'legislacions', :action => 'destroy', :id => 1} to /legislacions/1" do
      route_for(:controller => "legislacions", :action => "destroy", :id => 1).should == "/legislacions/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'legislacions', action => 'index' } from GET /legislacions" do
      params_from(:get, "/legislacions").should == {:controller => "legislacions", :action => "index"}
    end
  
    it "should generate params { :controller => 'legislacions', action => 'new' } from GET /legislacions/new" do
      params_from(:get, "/legislacions/new").should == {:controller => "legislacions", :action => "new"}
    end
  
    it "should generate params { :controller => 'legislacions', action => 'create' } from POST /legislacions" do
      params_from(:post, "/legislacions").should == {:controller => "legislacions", :action => "create"}
    end
  
    it "should generate params { :controller => 'legislacions', action => 'show', id => '1' } from GET /legislacions/1" do
      params_from(:get, "/legislacions/1").should == {:controller => "legislacions", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'legislacions', action => 'edit', id => '1' } from GET /legislacions/1;edit" do
      params_from(:get, "/legislacions/1/edit").should == {:controller => "legislacions", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'legislacions', action => 'update', id => '1' } from PUT /legislacions/1" do
      params_from(:put, "/legislacions/1").should == {:controller => "legislacions", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'legislacions', action => 'destroy', id => '1' } from DELETE /legislacions/1" do
      params_from(:delete, "/legislacions/1").should == {:controller => "legislacions", :action => "destroy", :id => "1"}
    end
  end
end