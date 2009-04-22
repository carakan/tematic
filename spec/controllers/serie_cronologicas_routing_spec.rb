require File.dirname(__FILE__) + '/../spec_helper'

describe SerieCronologicasController do
  describe "route generation" do

    it "should map { :controller => 'serie_cronologicas', :action => 'index' } to /serie_cronologicas" do
      route_for(:controller => "serie_cronologicas", :action => "index").should == "/serie_cronologicas"
    end
  
    it "should map { :controller => 'serie_cronologicas', :action => 'new' } to /serie_cronologicas/new" do
      route_for(:controller => "serie_cronologicas", :action => "new").should == "/serie_cronologicas/new"
    end
  
    it "should map { :controller => 'serie_cronologicas', :action => 'show', :id => 1 } to /serie_cronologicas/1" do
      route_for(:controller => "serie_cronologicas", :action => "show", :id => 1).should == "/serie_cronologicas/1"
    end
  
    it "should map { :controller => 'serie_cronologicas', :action => 'edit', :id => 1 } to /serie_cronologicas/1/edit" do
      route_for(:controller => "serie_cronologicas", :action => "edit", :id => 1).should == "/serie_cronologicas/1/edit"
    end
  
    it "should map { :controller => 'serie_cronologicas', :action => 'update', :id => 1} to /serie_cronologicas/1" do
      route_for(:controller => "serie_cronologicas", :action => "update", :id => 1).should == "/serie_cronologicas/1"
    end
  
    it "should map { :controller => 'serie_cronologicas', :action => 'destroy', :id => 1} to /serie_cronologicas/1" do
      route_for(:controller => "serie_cronologicas", :action => "destroy", :id => 1).should == "/serie_cronologicas/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'serie_cronologicas', action => 'index' } from GET /serie_cronologicas" do
      params_from(:get, "/serie_cronologicas").should == {:controller => "serie_cronologicas", :action => "index"}
    end
  
    it "should generate params { :controller => 'serie_cronologicas', action => 'new' } from GET /serie_cronologicas/new" do
      params_from(:get, "/serie_cronologicas/new").should == {:controller => "serie_cronologicas", :action => "new"}
    end
  
    it "should generate params { :controller => 'serie_cronologicas', action => 'create' } from POST /serie_cronologicas" do
      params_from(:post, "/serie_cronologicas").should == {:controller => "serie_cronologicas", :action => "create"}
    end
  
    it "should generate params { :controller => 'serie_cronologicas', action => 'show', id => '1' } from GET /serie_cronologicas/1" do
      params_from(:get, "/serie_cronologicas/1").should == {:controller => "serie_cronologicas", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'serie_cronologicas', action => 'edit', id => '1' } from GET /serie_cronologicas/1;edit" do
      params_from(:get, "/serie_cronologicas/1/edit").should == {:controller => "serie_cronologicas", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'serie_cronologicas', action => 'update', id => '1' } from PUT /serie_cronologicas/1" do
      params_from(:put, "/serie_cronologicas/1").should == {:controller => "serie_cronologicas", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'serie_cronologicas', action => 'destroy', id => '1' } from DELETE /serie_cronologicas/1" do
      params_from(:delete, "/serie_cronologicas/1").should == {:controller => "serie_cronologicas", :action => "destroy", :id => "1"}
    end
  end
end