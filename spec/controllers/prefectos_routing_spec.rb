require File.dirname(__FILE__) + '/../spec_helper'

describe PrefectosController do
  describe "route generation" do

    it "should map { :controller => 'prefectos', :action => 'index' } to /prefectos" do
      route_for(:controller => "prefectos", :action => "index").should == "/prefectos"
    end
  
    it "should map { :controller => 'prefectos', :action => 'new' } to /prefectos/new" do
      route_for(:controller => "prefectos", :action => "new").should == "/prefectos/new"
    end
  
    it "should map { :controller => 'prefectos', :action => 'show', :id => 1 } to /prefectos/1" do
      route_for(:controller => "prefectos", :action => "show", :id => 1).should == "/prefectos/1"
    end
  
    it "should map { :controller => 'prefectos', :action => 'edit', :id => 1 } to /prefectos/1/edit" do
      route_for(:controller => "prefectos", :action => "edit", :id => 1).should == "/prefectos/1/edit"
    end
  
    it "should map { :controller => 'prefectos', :action => 'update', :id => 1} to /prefectos/1" do
      route_for(:controller => "prefectos", :action => "update", :id => 1).should == "/prefectos/1"
    end
  
    it "should map { :controller => 'prefectos', :action => 'destroy', :id => 1} to /prefectos/1" do
      route_for(:controller => "prefectos", :action => "destroy", :id => 1).should == "/prefectos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'prefectos', action => 'index' } from GET /prefectos" do
      params_from(:get, "/prefectos").should == {:controller => "prefectos", :action => "index"}
    end
  
    it "should generate params { :controller => 'prefectos', action => 'new' } from GET /prefectos/new" do
      params_from(:get, "/prefectos/new").should == {:controller => "prefectos", :action => "new"}
    end
  
    it "should generate params { :controller => 'prefectos', action => 'create' } from POST /prefectos" do
      params_from(:post, "/prefectos").should == {:controller => "prefectos", :action => "create"}
    end
  
    it "should generate params { :controller => 'prefectos', action => 'show', id => '1' } from GET /prefectos/1" do
      params_from(:get, "/prefectos/1").should == {:controller => "prefectos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'prefectos', action => 'edit', id => '1' } from GET /prefectos/1;edit" do
      params_from(:get, "/prefectos/1/edit").should == {:controller => "prefectos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'prefectos', action => 'update', id => '1' } from PUT /prefectos/1" do
      params_from(:put, "/prefectos/1").should == {:controller => "prefectos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'prefectos', action => 'destroy', id => '1' } from DELETE /prefectos/1" do
      params_from(:delete, "/prefectos/1").should == {:controller => "prefectos", :action => "destroy", :id => "1"}
    end
  end
end