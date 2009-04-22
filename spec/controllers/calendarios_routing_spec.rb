require File.dirname(__FILE__) + '/../spec_helper'

describe CalendariosController do
  describe "route generation" do

    it "should map { :controller => 'calendarios', :action => 'index' } to /calendarios" do
      route_for(:controller => "calendarios", :action => "index").should == "/calendarios"
    end
  
    it "should map { :controller => 'calendarios', :action => 'new' } to /calendarios/new" do
      route_for(:controller => "calendarios", :action => "new").should == "/calendarios/new"
    end
  
    it "should map { :controller => 'calendarios', :action => 'show', :id => 1 } to /calendarios/1" do
      route_for(:controller => "calendarios", :action => "show", :id => 1).should == "/calendarios/1"
    end
  
    it "should map { :controller => 'calendarios', :action => 'edit', :id => 1 } to /calendarios/1/edit" do
      route_for(:controller => "calendarios", :action => "edit", :id => 1).should == "/calendarios/1/edit"
    end
  
    it "should map { :controller => 'calendarios', :action => 'update', :id => 1} to /calendarios/1" do
      route_for(:controller => "calendarios", :action => "update", :id => 1).should == "/calendarios/1"
    end
  
    it "should map { :controller => 'calendarios', :action => 'destroy', :id => 1} to /calendarios/1" do
      route_for(:controller => "calendarios", :action => "destroy", :id => 1).should == "/calendarios/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'calendarios', action => 'index' } from GET /calendarios" do
      params_from(:get, "/calendarios").should == {:controller => "calendarios", :action => "index"}
    end
  
    it "should generate params { :controller => 'calendarios', action => 'new' } from GET /calendarios/new" do
      params_from(:get, "/calendarios/new").should == {:controller => "calendarios", :action => "new"}
    end
  
    it "should generate params { :controller => 'calendarios', action => 'create' } from POST /calendarios" do
      params_from(:post, "/calendarios").should == {:controller => "calendarios", :action => "create"}
    end
  
    it "should generate params { :controller => 'calendarios', action => 'show', id => '1' } from GET /calendarios/1" do
      params_from(:get, "/calendarios/1").should == {:controller => "calendarios", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'calendarios', action => 'edit', id => '1' } from GET /calendarios/1;edit" do
      params_from(:get, "/calendarios/1/edit").should == {:controller => "calendarios", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'calendarios', action => 'update', id => '1' } from PUT /calendarios/1" do
      params_from(:put, "/calendarios/1").should == {:controller => "calendarios", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'calendarios', action => 'destroy', id => '1' } from DELETE /calendarios/1" do
      params_from(:delete, "/calendarios/1").should == {:controller => "calendarios", :action => "destroy", :id => "1"}
    end
  end
end