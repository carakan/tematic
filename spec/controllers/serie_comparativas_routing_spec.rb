require File.dirname(__FILE__) + '/../spec_helper'

describe SerieComparativasController do
  describe "route generation" do

    it "should map { :controller => 'serie_comparativas', :action => 'index' } to /serie_comparativas" do
      route_for(:controller => "serie_comparativas", :action => "index").should == "/serie_comparativas"
    end
  
    it "should map { :controller => 'serie_comparativas', :action => 'new' } to /serie_comparativas/new" do
      route_for(:controller => "serie_comparativas", :action => "new").should == "/serie_comparativas/new"
    end
  
    it "should map { :controller => 'serie_comparativas', :action => 'show', :id => 1 } to /serie_comparativas/1" do
      route_for(:controller => "serie_comparativas", :action => "show", :id => 1).should == "/serie_comparativas/1"
    end
  
    it "should map { :controller => 'serie_comparativas', :action => 'edit', :id => 1 } to /serie_comparativas/1/edit" do
      route_for(:controller => "serie_comparativas", :action => "edit", :id => 1).should == "/serie_comparativas/1/edit"
    end
  
    it "should map { :controller => 'serie_comparativas', :action => 'update', :id => 1} to /serie_comparativas/1" do
      route_for(:controller => "serie_comparativas", :action => "update", :id => 1).should == "/serie_comparativas/1"
    end
  
    it "should map { :controller => 'serie_comparativas', :action => 'destroy', :id => 1} to /serie_comparativas/1" do
      route_for(:controller => "serie_comparativas", :action => "destroy", :id => 1).should == "/serie_comparativas/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'serie_comparativas', action => 'index' } from GET /serie_comparativas" do
      params_from(:get, "/serie_comparativas").should == {:controller => "serie_comparativas", :action => "index"}
    end
  
    it "should generate params { :controller => 'serie_comparativas', action => 'new' } from GET /serie_comparativas/new" do
      params_from(:get, "/serie_comparativas/new").should == {:controller => "serie_comparativas", :action => "new"}
    end
  
    it "should generate params { :controller => 'serie_comparativas', action => 'create' } from POST /serie_comparativas" do
      params_from(:post, "/serie_comparativas").should == {:controller => "serie_comparativas", :action => "create"}
    end
  
    it "should generate params { :controller => 'serie_comparativas', action => 'show', id => '1' } from GET /serie_comparativas/1" do
      params_from(:get, "/serie_comparativas/1").should == {:controller => "serie_comparativas", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'serie_comparativas', action => 'edit', id => '1' } from GET /serie_comparativas/1;edit" do
      params_from(:get, "/serie_comparativas/1/edit").should == {:controller => "serie_comparativas", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'serie_comparativas', action => 'update', id => '1' } from PUT /serie_comparativas/1" do
      params_from(:put, "/serie_comparativas/1").should == {:controller => "serie_comparativas", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'serie_comparativas', action => 'destroy', id => '1' } from DELETE /serie_comparativas/1" do
      params_from(:delete, "/serie_comparativas/1").should == {:controller => "serie_comparativas", :action => "destroy", :id => "1"}
    end
  end
end