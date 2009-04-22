require File.dirname(__FILE__) + '/../spec_helper'

describe InstitucionPeriodisticaController do

  #Delete these examples and add some real ones
  it "should use InstitucionPeriodisticaController" do
    controller.should be_an_instance_of(InstitucionPeriodisticaController)
  end


  describe "GET 'institucion:string'" do
    it "should be successful" do
      get 'institucion:string'
      response.should be_success
    end
  end

  describe "GET 'sigla:string'" do
    it "should be successful" do
      get 'sigla:string'
      response.should be_success
    end
  end

  describe "GET 'direccion:string'" do
    it "should be successful" do
      get 'direccion:string'
      response.should be_success
    end
  end

  describe "GET 'telefono:string'" do
    it "should be successful" do
      get 'telefono:string'
      response.should be_success
    end
  end

  describe "GET 'fax:string'" do
    it "should be successful" do
      get 'fax:string'
      response.should be_success
    end
  end

  describe "GET 'casilla:string'" do
    it "should be successful" do
      get 'casilla:string'
      response.should be_success
    end
  end

  describe "GET 'email:string'" do
    it "should be successful" do
      get 'email:string'
      response.should be_success
    end
  end

  describe "GET 'paginaWeb:string'" do
    it "should be successful" do
      get 'paginaWeb:string'
      response.should be_success
    end
  end
end
