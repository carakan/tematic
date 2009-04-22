require File.dirname(__FILE__) + '/../spec_helper'

describe AlcaldesController do
  describe "route generation" do

    it "should map { :controller => 'alcaldes', :action => 'index' } to /alcaldes" do
      route_for(:controller => "alcaldes", :action => "index").should == "/alcaldes"
    end
  
    it "should map { :controller => 'alcaldes', :action => 'new' } to /alcaldes/new" do
      route_for(:controller => "alcaldes", :action => "new").should == "/alcaldes/new"
    end
  
    it "should map { :controller => 'alcaldes', :action => 'show', :id => 1 } to /alcaldes/1" do
      route_for(:controller => "alcaldes", :action => "show", :id => 1).should == "/alcaldes/1"
    end
  
    it "should map { :controller => 'alcaldes', :action => 'edit', :id => 1 } to /alcaldes/1/edit" do
      route_for(:controller => "alcaldes", :action => "edit", :id => 1).should == "/alcaldes/1/edit"
    end
  
    it "should map { :controller => 'alcaldes', :action => 'update', :id => 1} to /alcaldes/1" do
      route_for(:controller => "alcaldes", :action => "update", :id => 1).should == "/alcaldes/1"
    end
  
    it "should map { :controller => 'alcaldes', :action => 'destroy', :id => 1} to /alcaldes/1" do
      route_for(:controller => "alcaldes", :action => "destroy", :id => 1).should == "/alcaldes/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'alcaldes', action => 'index' } from GET /alcaldes" do
      params_from(:get, "/alcaldes").should == {:controller => "alcaldes", :action => "index"}
    end
  
    it "should generate params { :controller => 'alcaldes', action => 'new' } from GET /alcaldes/new" do
      params_from(:get, "/alcaldes/new").should == {:controller => "alcaldes", :action => "new"}
    end
  
    it "should generate params { :controller => 'alcaldes', action => 'create' } from POST /alcaldes" do
      params_from(:post, "/alcaldes").should == {:controller => "alcaldes", :action => "create"}
    end
  
    it "should generate params { :controller => 'alcaldes', action => 'show', id => '1' } from GET /alcaldes/1" do
      params_from(:get, "/alcaldes/1").should == {:controller => "alcaldes", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'alcaldes', action => 'edit', id => '1' } from GET /alcaldes/1;edit" do
      params_from(:get, "/alcaldes/1/edit").should == {:controller => "alcaldes", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'alcaldes', action => 'update', id => '1' } from PUT /alcaldes/1" do
      params_from(:put, "/alcaldes/1").should == {:controller => "alcaldes", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'alcaldes', action => 'destroy', id => '1' } from DELETE /alcaldes/1" do
      params_from(:delete, "/alcaldes/1").should == {:controller => "alcaldes", :action => "destroy", :id => "1"}
    end
  end
end