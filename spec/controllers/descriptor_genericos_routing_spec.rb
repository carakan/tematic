require File.dirname(__FILE__) + '/../spec_helper'

describe DescriptorGenericosController do
  describe "route generation" do

    it "should map { :controller => 'descriptor_genericos', :action => 'index' } to /descriptor_genericos" do
      route_for(:controller => "descriptor_genericos", :action => "index").should == "/descriptor_genericos"
    end
  
    it "should map { :controller => 'descriptor_genericos', :action => 'new' } to /descriptor_genericos/new" do
      route_for(:controller => "descriptor_genericos", :action => "new").should == "/descriptor_genericos/new"
    end
  
    it "should map { :controller => 'descriptor_genericos', :action => 'show', :id => 1 } to /descriptor_genericos/1" do
      route_for(:controller => "descriptor_genericos", :action => "show", :id => 1).should == "/descriptor_genericos/1"
    end
  
    it "should map { :controller => 'descriptor_genericos', :action => 'edit', :id => 1 } to /descriptor_genericos/1/edit" do
      route_for(:controller => "descriptor_genericos", :action => "edit", :id => 1).should == "/descriptor_genericos/1/edit"
    end
  
    it "should map { :controller => 'descriptor_genericos', :action => 'update', :id => 1} to /descriptor_genericos/1" do
      route_for(:controller => "descriptor_genericos", :action => "update", :id => 1).should == "/descriptor_genericos/1"
    end
  
    it "should map { :controller => 'descriptor_genericos', :action => 'destroy', :id => 1} to /descriptor_genericos/1" do
      route_for(:controller => "descriptor_genericos", :action => "destroy", :id => 1).should == "/descriptor_genericos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'descriptor_genericos', action => 'index' } from GET /descriptor_genericos" do
      params_from(:get, "/descriptor_genericos").should == {:controller => "descriptor_genericos", :action => "index"}
    end
  
    it "should generate params { :controller => 'descriptor_genericos', action => 'new' } from GET /descriptor_genericos/new" do
      params_from(:get, "/descriptor_genericos/new").should == {:controller => "descriptor_genericos", :action => "new"}
    end
  
    it "should generate params { :controller => 'descriptor_genericos', action => 'create' } from POST /descriptor_genericos" do
      params_from(:post, "/descriptor_genericos").should == {:controller => "descriptor_genericos", :action => "create"}
    end
  
    it "should generate params { :controller => 'descriptor_genericos', action => 'show', id => '1' } from GET /descriptor_genericos/1" do
      params_from(:get, "/descriptor_genericos/1").should == {:controller => "descriptor_genericos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'descriptor_genericos', action => 'edit', id => '1' } from GET /descriptor_genericos/1;edit" do
      params_from(:get, "/descriptor_genericos/1/edit").should == {:controller => "descriptor_genericos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'descriptor_genericos', action => 'update', id => '1' } from PUT /descriptor_genericos/1" do
      params_from(:put, "/descriptor_genericos/1").should == {:controller => "descriptor_genericos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'descriptor_genericos', action => 'destroy', id => '1' } from DELETE /descriptor_genericos/1" do
      params_from(:delete, "/descriptor_genericos/1").should == {:controller => "descriptor_genericos", :action => "destroy", :id => "1"}
    end
  end
end