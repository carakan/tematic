require File.dirname(__FILE__) + '/../spec_helper'

describe PeriodistasController do
  describe "route generation" do

    it "should map { :controller => 'periodistas', :action => 'index' } to /periodistas" do
      route_for(:controller => "periodistas", :action => "index").should == "/periodistas"
    end
  
    it "should map { :controller => 'periodistas', :action => 'new' } to /periodistas/new" do
      route_for(:controller => "periodistas", :action => "new").should == "/periodistas/new"
    end
  
    it "should map { :controller => 'periodistas', :action => 'show', :id => 1 } to /periodistas/1" do
      route_for(:controller => "periodistas", :action => "show", :id => 1).should == "/periodistas/1"
    end
  
    it "should map { :controller => 'periodistas', :action => 'edit', :id => 1 } to /periodistas/1/edit" do
      route_for(:controller => "periodistas", :action => "edit", :id => 1).should == "/periodistas/1/edit"
    end
  
    it "should map { :controller => 'periodistas', :action => 'update', :id => 1} to /periodistas/1" do
      route_for(:controller => "periodistas", :action => "update", :id => 1).should == "/periodistas/1"
    end
  
    it "should map { :controller => 'periodistas', :action => 'destroy', :id => 1} to /periodistas/1" do
      route_for(:controller => "periodistas", :action => "destroy", :id => 1).should == "/periodistas/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'periodistas', action => 'index' } from GET /periodistas" do
      params_from(:get, "/periodistas").should == {:controller => "periodistas", :action => "index"}
    end
  
    it "should generate params { :controller => 'periodistas', action => 'new' } from GET /periodistas/new" do
      params_from(:get, "/periodistas/new").should == {:controller => "periodistas", :action => "new"}
    end
  
    it "should generate params { :controller => 'periodistas', action => 'create' } from POST /periodistas" do
      params_from(:post, "/periodistas").should == {:controller => "periodistas", :action => "create"}
    end
  
    it "should generate params { :controller => 'periodistas', action => 'show', id => '1' } from GET /periodistas/1" do
      params_from(:get, "/periodistas/1").should == {:controller => "periodistas", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'periodistas', action => 'edit', id => '1' } from GET /periodistas/1;edit" do
      params_from(:get, "/periodistas/1/edit").should == {:controller => "periodistas", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'periodistas', action => 'update', id => '1' } from PUT /periodistas/1" do
      params_from(:put, "/periodistas/1").should == {:controller => "periodistas", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'periodistas', action => 'destroy', id => '1' } from DELETE /periodistas/1" do
      params_from(:delete, "/periodistas/1").should == {:controller => "periodistas", :action => "destroy", :id => "1"}
    end
  end
end