require File.dirname(__FILE__) + '/../spec_helper'

describe EnlacesController do
  describe "route generation" do

    it "should map { :controller => 'enlaces', :action => 'index' } to /enlaces" do
      route_for(:controller => "enlaces", :action => "index").should == "/enlaces"
    end
  
    it "should map { :controller => 'enlaces', :action => 'new' } to /enlaces/new" do
      route_for(:controller => "enlaces", :action => "new").should == "/enlaces/new"
    end
  
    it "should map { :controller => 'enlaces', :action => 'show', :id => 1 } to /enlaces/1" do
      route_for(:controller => "enlaces", :action => "show", :id => 1).should == "/enlaces/1"
    end
  
    it "should map { :controller => 'enlaces', :action => 'edit', :id => 1 } to /enlaces/1/edit" do
      route_for(:controller => "enlaces", :action => "edit", :id => 1).should == "/enlaces/1/edit"
    end
  
    it "should map { :controller => 'enlaces', :action => 'update', :id => 1} to /enlaces/1" do
      route_for(:controller => "enlaces", :action => "update", :id => 1).should == "/enlaces/1"
    end
  
    it "should map { :controller => 'enlaces', :action => 'destroy', :id => 1} to /enlaces/1" do
      route_for(:controller => "enlaces", :action => "destroy", :id => 1).should == "/enlaces/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'enlaces', action => 'index' } from GET /enlaces" do
      params_from(:get, "/enlaces").should == {:controller => "enlaces", :action => "index"}
    end
  
    it "should generate params { :controller => 'enlaces', action => 'new' } from GET /enlaces/new" do
      params_from(:get, "/enlaces/new").should == {:controller => "enlaces", :action => "new"}
    end
  
    it "should generate params { :controller => 'enlaces', action => 'create' } from POST /enlaces" do
      params_from(:post, "/enlaces").should == {:controller => "enlaces", :action => "create"}
    end
  
    it "should generate params { :controller => 'enlaces', action => 'show', id => '1' } from GET /enlaces/1" do
      params_from(:get, "/enlaces/1").should == {:controller => "enlaces", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'enlaces', action => 'edit', id => '1' } from GET /enlaces/1;edit" do
      params_from(:get, "/enlaces/1/edit").should == {:controller => "enlaces", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'enlaces', action => 'update', id => '1' } from PUT /enlaces/1" do
      params_from(:put, "/enlaces/1").should == {:controller => "enlaces", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'enlaces', action => 'destroy', id => '1' } from DELETE /enlaces/1" do
      params_from(:delete, "/enlaces/1").should == {:controller => "enlaces", :action => "destroy", :id => "1"}
    end
  end
end