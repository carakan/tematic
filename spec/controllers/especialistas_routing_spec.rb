require File.dirname(__FILE__) + '/../spec_helper'

describe EspecialistasController do
  describe "route generation" do

    it "should map { :controller => 'especialistas', :action => 'index' } to /especialistas" do
      route_for(:controller => "especialistas", :action => "index").should == "/especialistas"
    end
  
    it "should map { :controller => 'especialistas', :action => 'new' } to /especialistas/new" do
      route_for(:controller => "especialistas", :action => "new").should == "/especialistas/new"
    end
  
    it "should map { :controller => 'especialistas', :action => 'show', :id => 1 } to /especialistas/1" do
      route_for(:controller => "especialistas", :action => "show", :id => 1).should == "/especialistas/1"
    end
  
    it "should map { :controller => 'especialistas', :action => 'edit', :id => 1 } to /especialistas/1/edit" do
      route_for(:controller => "especialistas", :action => "edit", :id => 1).should == "/especialistas/1/edit"
    end
  
    it "should map { :controller => 'especialistas', :action => 'update', :id => 1} to /especialistas/1" do
      route_for(:controller => "especialistas", :action => "update", :id => 1).should == "/especialistas/1"
    end
  
    it "should map { :controller => 'especialistas', :action => 'destroy', :id => 1} to /especialistas/1" do
      route_for(:controller => "especialistas", :action => "destroy", :id => 1).should == "/especialistas/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'especialistas', action => 'index' } from GET /especialistas" do
      params_from(:get, "/especialistas").should == {:controller => "especialistas", :action => "index"}
    end
  
    it "should generate params { :controller => 'especialistas', action => 'new' } from GET /especialistas/new" do
      params_from(:get, "/especialistas/new").should == {:controller => "especialistas", :action => "new"}
    end
  
    it "should generate params { :controller => 'especialistas', action => 'create' } from POST /especialistas" do
      params_from(:post, "/especialistas").should == {:controller => "especialistas", :action => "create"}
    end
  
    it "should generate params { :controller => 'especialistas', action => 'show', id => '1' } from GET /especialistas/1" do
      params_from(:get, "/especialistas/1").should == {:controller => "especialistas", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'especialistas', action => 'edit', id => '1' } from GET /especialistas/1;edit" do
      params_from(:get, "/especialistas/1/edit").should == {:controller => "especialistas", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'especialistas', action => 'update', id => '1' } from PUT /especialistas/1" do
      params_from(:put, "/especialistas/1").should == {:controller => "especialistas", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'especialistas', action => 'destroy', id => '1' } from DELETE /especialistas/1" do
      params_from(:delete, "/especialistas/1").should == {:controller => "especialistas", :action => "destroy", :id => "1"}
    end
  end
end