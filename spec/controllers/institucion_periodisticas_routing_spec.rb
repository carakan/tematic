require File.dirname(__FILE__) + '/../spec_helper'

describe InstitucionPeriodisticasController do
  describe "route generation" do

    it "should map { :controller => 'institucion_periodisticas', :action => 'index' } to /institucion_periodisticas" do
      route_for(:controller => "institucion_periodisticas", :action => "index").should == "/institucion_periodisticas"
    end
  
    it "should map { :controller => 'institucion_periodisticas', :action => 'new' } to /institucion_periodisticas/new" do
      route_for(:controller => "institucion_periodisticas", :action => "new").should == "/institucion_periodisticas/new"
    end
  
    it "should map { :controller => 'institucion_periodisticas', :action => 'show', :id => 1 } to /institucion_periodisticas/1" do
      route_for(:controller => "institucion_periodisticas", :action => "show", :id => 1).should == "/institucion_periodisticas/1"
    end
  
    it "should map { :controller => 'institucion_periodisticas', :action => 'edit', :id => 1 } to /institucion_periodisticas/1/edit" do
      route_for(:controller => "institucion_periodisticas", :action => "edit", :id => 1).should == "/institucion_periodisticas/1/edit"
    end
  
    it "should map { :controller => 'institucion_periodisticas', :action => 'update', :id => 1} to /institucion_periodisticas/1" do
      route_for(:controller => "institucion_periodisticas", :action => "update", :id => 1).should == "/institucion_periodisticas/1"
    end
  
    it "should map { :controller => 'institucion_periodisticas', :action => 'destroy', :id => 1} to /institucion_periodisticas/1" do
      route_for(:controller => "institucion_periodisticas", :action => "destroy", :id => 1).should == "/institucion_periodisticas/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'institucion_periodisticas', action => 'index' } from GET /institucion_periodisticas" do
      params_from(:get, "/institucion_periodisticas").should == {:controller => "institucion_periodisticas", :action => "index"}
    end
  
    it "should generate params { :controller => 'institucion_periodisticas', action => 'new' } from GET /institucion_periodisticas/new" do
      params_from(:get, "/institucion_periodisticas/new").should == {:controller => "institucion_periodisticas", :action => "new"}
    end
  
    it "should generate params { :controller => 'institucion_periodisticas', action => 'create' } from POST /institucion_periodisticas" do
      params_from(:post, "/institucion_periodisticas").should == {:controller => "institucion_periodisticas", :action => "create"}
    end
  
    it "should generate params { :controller => 'institucion_periodisticas', action => 'show', id => '1' } from GET /institucion_periodisticas/1" do
      params_from(:get, "/institucion_periodisticas/1").should == {:controller => "institucion_periodisticas", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'institucion_periodisticas', action => 'edit', id => '1' } from GET /institucion_periodisticas/1;edit" do
      params_from(:get, "/institucion_periodisticas/1/edit").should == {:controller => "institucion_periodisticas", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'institucion_periodisticas', action => 'update', id => '1' } from PUT /institucion_periodisticas/1" do
      params_from(:put, "/institucion_periodisticas/1").should == {:controller => "institucion_periodisticas", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'institucion_periodisticas', action => 'destroy', id => '1' } from DELETE /institucion_periodisticas/1" do
      params_from(:delete, "/institucion_periodisticas/1").should == {:controller => "institucion_periodisticas", :action => "destroy", :id => "1"}
    end
  end
end