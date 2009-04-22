require File.dirname(__FILE__) + '/../spec_helper'

describe FavoritosController do
  describe "handling GET /favoritos" do

    before(:each) do
      @favorito = mock_model(Favorito)
      Favorito.stub!(:find).and_return([@favorito])
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
  
    it "should find all favoritos" do
      Favorito.should_receive(:find).with(:all).and_return([@favorito])
      do_get
    end
  
    it "should assign the found favoritos for the view" do
      do_get
      assigns[:favoritos].should == [@favorito]
    end
  end

  describe "handling GET /favoritos.xml" do

    before(:each) do
      @favorito = mock_model(Favorito, :to_xml => "XML")
      Favorito.stub!(:find).and_return(@favorito)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all favoritos" do
      Favorito.should_receive(:find).with(:all).and_return([@favorito])
      do_get
    end
  
    it "should render the found favoritos as xml" do
      @favorito.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /favoritos/1" do

    before(:each) do
      @favorito = mock_model(Favorito)
      Favorito.stub!(:find).and_return(@favorito)
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
  
    it "should find the favorito requested" do
      Favorito.should_receive(:find).with("1").and_return(@favorito)
      do_get
    end
  
    it "should assign the found favorito for the view" do
      do_get
      assigns[:favorito].should equal(@favorito)
    end
  end

  describe "handling GET /favoritos/1.xml" do

    before(:each) do
      @favorito = mock_model(Favorito, :to_xml => "XML")
      Favorito.stub!(:find).and_return(@favorito)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the favorito requested" do
      Favorito.should_receive(:find).with("1").and_return(@favorito)
      do_get
    end
  
    it "should render the found favorito as xml" do
      @favorito.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /favoritos/new" do

    before(:each) do
      @favorito = mock_model(Favorito)
      Favorito.stub!(:new).and_return(@favorito)
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
  
    it "should create an new favorito" do
      Favorito.should_receive(:new).and_return(@favorito)
      do_get
    end
  
    it "should not save the new favorito" do
      @favorito.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new favorito for the view" do
      do_get
      assigns[:favorito].should equal(@favorito)
    end
  end

  describe "handling GET /favoritos/1/edit" do

    before(:each) do
      @favorito = mock_model(Favorito)
      Favorito.stub!(:find).and_return(@favorito)
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
  
    it "should find the favorito requested" do
      Favorito.should_receive(:find).and_return(@favorito)
      do_get
    end
  
    it "should assign the found Favorito for the view" do
      do_get
      assigns[:favorito].should equal(@favorito)
    end
  end

  describe "handling POST /favoritos" do

    before(:each) do
      @favorito = mock_model(Favorito, :to_param => "1")
      Favorito.stub!(:new).and_return(@favorito)
    end
    
    describe "with successful save" do
  
      def do_post
        @favorito.should_receive(:save).and_return(true)
        post :create, :favorito => {}
      end
  
      it "should create a new favorito" do
        Favorito.should_receive(:new).with({}).and_return(@favorito)
        do_post
      end

      it "should redirect to the new favorito" do
        do_post
        response.should redirect_to(favorito_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @favorito.should_receive(:save).and_return(false)
        post :create, :favorito => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /favoritos/1" do

    before(:each) do
      @favorito = mock_model(Favorito, :to_param => "1")
      Favorito.stub!(:find).and_return(@favorito)
    end
    
    describe "with successful update" do

      def do_put
        @favorito.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the favorito requested" do
        Favorito.should_receive(:find).with("1").and_return(@favorito)
        do_put
      end

      it "should update the found favorito" do
        do_put
        assigns(:favorito).should equal(@favorito)
      end

      it "should assign the found favorito for the view" do
        do_put
        assigns(:favorito).should equal(@favorito)
      end

      it "should redirect to the favorito" do
        do_put
        response.should redirect_to(favorito_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @favorito.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /favoritos/1" do

    before(:each) do
      @favorito = mock_model(Favorito, :destroy => true)
      Favorito.stub!(:find).and_return(@favorito)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the favorito requested" do
      Favorito.should_receive(:find).with("1").and_return(@favorito)
      do_delete
    end
  
    it "should call destroy on the found favorito" do
      @favorito.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the favoritos list" do
      do_delete
      response.should redirect_to(favoritos_url)
    end
  end
end