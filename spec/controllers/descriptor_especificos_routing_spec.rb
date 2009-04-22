require File.dirname(__FILE__) + '/../spec_helper'

describe DescriptorEspecificosController do
  describe "route generation" do

    it "should map { :controller => 'descriptor_especificos', :action => 'index' } to /descriptor_especificos" do
      route_for(:controller => "descriptor_especificos", :action => "index").should == "/descriptor_especificos"
    end
  
    it "should map { :controller => 'descriptor_especificos', :action => 'new' } to /descriptor_especificos/new" do
      route_for(:controller => "descriptor_especificos", :action => "new").should == "/descriptor_especificos/new"
    end
  
    it "should map { :controller => 'descriptor_especificos', :action => 'show', :id => 1 } to /descriptor_especificos/1" do
      route_for(:controller => "descriptor_especificos", :action => "show", :id => 1).should == "/descriptor_especificos/1"
    end
  
    it "should map { :controller => 'descriptor_especificos', :action => 'edit', :id => 1 } to /descriptor_especificos/1/edit" do
      route_for(:controller => "descriptor_especificos", :action => "edit", :id => 1).should == "/descriptor_especificos/1/edit"
    end
  
    it "should map { :controller => 'descriptor_especificos', :action => 'update', :id => 1} to /descriptor_especificos/1" do
      route_for(:controller => "descriptor_especificos", :action => "update", :id => 1).should == "/descriptor_especificos/1"
    end
  
    it "should map { :controller => 'descriptor_especificos', :action => 'destroy', :id => 1} to /descriptor_especificos/1" do
      route_for(:controller => "descriptor_especificos", :action => "destroy", :id => 1).should == "/descriptor_especificos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'descriptor_especificos', action => 'index' } from GET /descriptor_especificos" do
      params_from(:get, "/descriptor_especificos").should == {:controller => "descriptor_especificos", :action => "index"}
    end
  
    it "should generate params { :controller => 'descriptor_especificos', action => 'new' } from GET /descriptor_especificos/new" do
      params_from(:get, "/descriptor_especificos/new").should == {:controller => "descriptor_especificos", :action => "new"}
    end
  
    it "should generate params { :controller => 'descriptor_especificos', action => 'create' } from POST /descriptor_especificos" do
      params_from(:post, "/descriptor_especificos").should == {:controller => "descriptor_especificos", :action => "create"}
    end
  
    it "should generate params { :controller => 'descriptor_especificos', action => 'show', id => '1' } from GET /descriptor_especificos/1" do
      params_from(:get, "/descriptor_especificos/1").should == {:controller => "descriptor_especificos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'descriptor_especificos', action => 'edit', id => '1' } from GET /descriptor_especificos/1;edit" do
      params_from(:get, "/descriptor_especificos/1/edit").should == {:controller => "descriptor_especificos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'descriptor_especificos', action => 'update', id => '1' } from PUT /descriptor_especificos/1" do
      params_from(:put, "/descriptor_especificos/1").should == {:controller => "descriptor_especificos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'descriptor_especificos', action => 'destroy', id => '1' } from DELETE /descriptor_especificos/1" do
      params_from(:delete, "/descriptor_especificos/1").should == {:controller => "descriptor_especificos", :action => "destroy", :id => "1"}
    end
  end
end