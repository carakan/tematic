require File.dirname(__FILE__) + '/../spec_helper'

describe ComentarioController do

  #Delete these examples and add some real ones
  it "should use ComentarioController" do
    controller.should be_an_instance_of(ComentarioController)
  end


  describe "GET 'nombre:string'" do
    it "should be successful" do
      get 'nombre:string'
      response.should be_success
    end
  end

  describe "GET 'email:string'" do
    it "should be successful" do
      get 'email:string'
      response.should be_success
    end
  end

  describe "GET 'pagina_web:string'" do
    it "should be successful" do
      get 'pagina_web:string'
      response.should be_success
    end
  end

  describe "GET 'comentario:text'" do
    it "should be successful" do
      get 'comentario:text'
      response.should be_success
    end
  end
end
