require File.dirname(__FILE__) + '/../spec_helper'

describe PartidoPoliticosController do
  describe "route generation" do

    it "should map { :controller => 'partido_politicos', :action => 'index' } to /partido_politicos" do
      route_for(:controller => "partido_politicos", :action => "index").should == "/partido_politicos"
    end
  
    it "should map { :controller => 'partido_politicos', :action => 'new' } to /partido_politicos/new" do
      route_for(:controller => "partido_politicos", :action => "new").should == "/partido_politicos/new"
    end
  
    it "should map { :controller => 'partido_politicos', :action => 'show', :id => 1 } to /partido_politicos/1" do
      route_for(:controller => "partido_politicos", :action => "show", :id => 1).should == "/partido_politicos/1"
    end
  
    it "should map { :controller => 'partido_politicos', :action => 'edit', :id => 1 } to /partido_politicos/1/edit" do
      route_for(:controller => "partido_politicos", :action => "edit", :id => 1).should == "/partido_politicos/1/edit"
    end
  
    it "should map { :controller => 'partido_politicos', :action => 'update', :id => 1} to /partido_politicos/1" do
      route_for(:controller => "partido_politicos", :action => "update", :id => 1).should == "/partido_politicos/1"
    end
  
    it "should map { :controller => 'partido_politicos', :action => 'destroy', :id => 1} to /partido_politicos/1" do
      route_for(:controller => "partido_politicos", :action => "destroy", :id => 1).should == "/partido_politicos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'partido_politicos', action => 'index' } from GET /partido_politicos" do
      params_from(:get, "/partido_politicos").should == {:controller => "partido_politicos", :action => "index"}
    end
  
    it "should generate params { :controller => 'partido_politicos', action => 'new' } from GET /partido_politicos/new" do
      params_from(:get, "/partido_politicos/new").should == {:controller => "partido_politicos", :action => "new"}
    end
  
    it "should generate params { :controller => 'partido_politicos', action => 'create' } from POST /partido_politicos" do
      params_from(:post, "/partido_politicos").should == {:controller => "partido_politicos", :action => "create"}
    end
  
    it "should generate params { :controller => 'partido_politicos', action => 'show', id => '1' } from GET /partido_politicos/1" do
      params_from(:get, "/partido_politicos/1").should == {:controller => "partido_politicos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'partido_politicos', action => 'edit', id => '1' } from GET /partido_politicos/1;edit" do
      params_from(:get, "/partido_politicos/1/edit").should == {:controller => "partido_politicos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'partido_politicos', action => 'update', id => '1' } from PUT /partido_politicos/1" do
      params_from(:put, "/partido_politicos/1").should == {:controller => "partido_politicos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'partido_politicos', action => 'destroy', id => '1' } from DELETE /partido_politicos/1" do
      params_from(:delete, "/partido_politicos/1").should == {:controller => "partido_politicos", :action => "destroy", :id => "1"}
    end
  end
end