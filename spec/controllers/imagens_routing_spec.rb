require File.dirname(__FILE__) + '/../spec_helper'

describe ImagensController do
  describe "route generation" do

    it "should map { :controller => 'imagens', :action => 'index' } to /imagens" do
      route_for(:controller => "imagens", :action => "index").should == "/imagens"
    end
  
    it "should map { :controller => 'imagens', :action => 'new' } to /imagens/new" do
      route_for(:controller => "imagens", :action => "new").should == "/imagens/new"
    end
  
    it "should map { :controller => 'imagens', :action => 'show', :id => 1 } to /imagens/1" do
      route_for(:controller => "imagens", :action => "show", :id => 1).should == "/imagens/1"
    end
  
    it "should map { :controller => 'imagens', :action => 'edit', :id => 1 } to /imagens/1/edit" do
      route_for(:controller => "imagens", :action => "edit", :id => 1).should == "/imagens/1/edit"
    end
  
    it "should map { :controller => 'imagens', :action => 'update', :id => 1} to /imagens/1" do
      route_for(:controller => "imagens", :action => "update", :id => 1).should == "/imagens/1"
    end
  
    it "should map { :controller => 'imagens', :action => 'destroy', :id => 1} to /imagens/1" do
      route_for(:controller => "imagens", :action => "destroy", :id => 1).should == "/imagens/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'imagens', action => 'index' } from GET /imagens" do
      params_from(:get, "/imagens").should == {:controller => "imagens", :action => "index"}
    end
  
    it "should generate params { :controller => 'imagens', action => 'new' } from GET /imagens/new" do
      params_from(:get, "/imagens/new").should == {:controller => "imagens", :action => "new"}
    end
  
    it "should generate params { :controller => 'imagens', action => 'create' } from POST /imagens" do
      params_from(:post, "/imagens").should == {:controller => "imagens", :action => "create"}
    end
  
    it "should generate params { :controller => 'imagens', action => 'show', id => '1' } from GET /imagens/1" do
      params_from(:get, "/imagens/1").should == {:controller => "imagens", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'imagens', action => 'edit', id => '1' } from GET /imagens/1;edit" do
      params_from(:get, "/imagens/1/edit").should == {:controller => "imagens", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'imagens', action => 'update', id => '1' } from PUT /imagens/1" do
      params_from(:put, "/imagens/1").should == {:controller => "imagens", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'imagens', action => 'destroy', id => '1' } from DELETE /imagens/1" do
      params_from(:delete, "/imagens/1").should == {:controller => "imagens", :action => "destroy", :id => "1"}
    end
  end
end