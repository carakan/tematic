require File.dirname(__FILE__) + '/../spec_helper'

describe DescriptorEspecificoController do

  #Delete these examples and add some real ones
  it "should use DescriptorEspecificoController" do
    controller.should be_an_instance_of(DescriptorEspecificoController)
  end


  describe "GET 'descriptorEspecifico:string'" do
    it "should be successful" do
      get 'descriptorEspecifico:string'
      response.should be_success
    end
  end
end
