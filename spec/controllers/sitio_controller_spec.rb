require File.dirname(__FILE__) + '/../spec_helper'

describe SitioController do

  #Delete these examples and add some real ones
  it "should use SitioController" do
    controller.should be_an_instance_of(SitioController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'acerca'" do
    it "should be successful" do
      get 'acerca'
      response.should be_success
    end
  end
end
