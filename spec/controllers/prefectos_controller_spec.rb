require File.dirname(__FILE__) + '/../spec_helper'

describe PrefectosController do
  describe "handling GET /prefectos" do

    before(:each) do
      @prefecto = mock_model(Prefecto)
      Prefecto.stub!(:find).and_return([@prefecto])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all prefectos" do
      Prefecto.should_receive(:find).with(:all).and_return([@prefecto])
      do_get
    end
  
    it "should assign the found prefectos for the view" do
      do_get
      assigns[:prefectos].should == [@prefecto]
    end
  end

  describe "handling GET /prefectos.xml" do

    before(:each) do
      @prefecto = mock_model(Prefecto, :to_xml => "XML")
      Prefecto.stub!(:find).and_return(@prefecto)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all prefectos" do
      Prefecto.should_receive(:find).with(:all).and_return([@prefecto])
      do_get
    end
  
    it "should render the found prefectos as xml" do
      @prefecto.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /prefectos/1" do

    before(:each) do
      @prefecto = mock_model(Prefecto)
      Prefecto.stub!(:find).and_return(@prefecto)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the prefecto requested" do
      Prefecto.should_receive(:find).with("1").and_return(@prefecto)
      do_get
    end
  
    it "should assign the found prefecto for the view" do
      do_get
      assigns[:prefecto].should equal(@prefecto)
    end
  end

  describe "handling GET /prefectos/1.xml" do

    before(:each) do
      @prefecto = mock_model(Prefecto, :to_xml => "XML")
      Prefecto.stub!(:find).and_return(@prefecto)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the prefecto requested" do
      Prefecto.should_receive(:find).with("1").and_return(@prefecto)
      do_get
    end
  
    it "should render the found prefecto as xml" do
      @prefecto.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /prefectos/new" do

    before(:each) do
      @prefecto = mock_model(Prefecto)
      Prefecto.stub!(:new).and_return(@prefecto)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new prefecto" do
      Prefecto.should_receive(:new).and_return(@prefecto)
      do_get
    end
  
    it "should not save the new prefecto" do
      @prefecto.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new prefecto for the view" do
      do_get
      assigns[:prefecto].should equal(@prefecto)
    end
  end

  describe "handling GET /prefectos/1/edit" do

    before(:each) do
      @prefecto = mock_model(Prefecto)
      Prefecto.stub!(:find).and_return(@prefecto)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the prefecto requested" do
      Prefecto.should_receive(:find).and_return(@prefecto)
      do_get
    end
  
    it "should assign the found Prefecto for the view" do
      do_get
      assigns[:prefecto].should equal(@prefecto)
    end
  end

  describe "handling POST /prefectos" do

    before(:each) do
      @prefecto = mock_model(Prefecto, :to_param => "1")
      Prefecto.stub!(:new).and_return(@prefecto)
    end
    
    describe "with successful save" do
  
      def do_post
        @prefecto.should_receive(:save).and_return(true)
        post :create, :prefecto => {}
      end
  
      it "should create a new prefecto" do
        Prefecto.should_receive(:new).with({}).and_return(@prefecto)
        do_post
      end

      it "should redirect to the new prefecto" do
        do_post
        response.should redirect_to(prefecto_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @prefecto.should_receive(:save).and_return(false)
        post :create, :prefecto => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /prefectos/1" do

    before(:each) do
      @prefecto = mock_model(Prefecto, :to_param => "1")
      Prefecto.stub!(:find).and_return(@prefecto)
    end
    
    describe "with successful update" do

      def do_put
        @prefecto.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the prefecto requested" do
        Prefecto.should_receive(:find).with("1").and_return(@prefecto)
        do_put
      end

      it "should update the found prefecto" do
        do_put
        assigns(:prefecto).should equal(@prefecto)
      end

      it "should assign the found prefecto for the view" do
        do_put
        assigns(:prefecto).should equal(@prefecto)
      end

      it "should redirect to the prefecto" do
        do_put
        response.should redirect_to(prefecto_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @prefecto.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /prefectos/1" do

    before(:each) do
      @prefecto = mock_model(Prefecto, :destroy => true)
      Prefecto.stub!(:find).and_return(@prefecto)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the prefecto requested" do
      Prefecto.should_receive(:find).with("1").and_return(@prefecto)
      do_delete
    end
  
    it "should call destroy on the found prefecto" do
      @prefecto.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the prefectos list" do
      do_delete
      response.should redirect_to(prefectos_url)
    end
  end
end