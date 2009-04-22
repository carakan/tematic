require File.dirname(__FILE__) + '/../spec_helper'

describe EnlaceUrlsController do
  describe "handling GET /enlace_urls" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl)
      EnlaceUrl.stub!(:find).and_return([@enlace_url])
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
  
    it "should find all enlace_urls" do
      EnlaceUrl.should_receive(:find).with(:all).and_return([@enlace_url])
      do_get
    end
  
    it "should assign the found enlace_urls for the view" do
      do_get
      assigns[:enlace_urls].should == [@enlace_url]
    end
  end

  describe "handling GET /enlace_urls.xml" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl, :to_xml => "XML")
      EnlaceUrl.stub!(:find).and_return(@enlace_url)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all enlace_urls" do
      EnlaceUrl.should_receive(:find).with(:all).and_return([@enlace_url])
      do_get
    end
  
    it "should render the found enlace_urls as xml" do
      @enlace_url.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /enlace_urls/1" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl)
      EnlaceUrl.stub!(:find).and_return(@enlace_url)
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
  
    it "should find the enlace_url requested" do
      EnlaceUrl.should_receive(:find).with("1").and_return(@enlace_url)
      do_get
    end
  
    it "should assign the found enlace_url for the view" do
      do_get
      assigns[:enlace_url].should equal(@enlace_url)
    end
  end

  describe "handling GET /enlace_urls/1.xml" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl, :to_xml => "XML")
      EnlaceUrl.stub!(:find).and_return(@enlace_url)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the enlace_url requested" do
      EnlaceUrl.should_receive(:find).with("1").and_return(@enlace_url)
      do_get
    end
  
    it "should render the found enlace_url as xml" do
      @enlace_url.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /enlace_urls/new" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl)
      EnlaceUrl.stub!(:new).and_return(@enlace_url)
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
  
    it "should create an new enlace_url" do
      EnlaceUrl.should_receive(:new).and_return(@enlace_url)
      do_get
    end
  
    it "should not save the new enlace_url" do
      @enlace_url.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new enlace_url for the view" do
      do_get
      assigns[:enlace_url].should equal(@enlace_url)
    end
  end

  describe "handling GET /enlace_urls/1/edit" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl)
      EnlaceUrl.stub!(:find).and_return(@enlace_url)
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
  
    it "should find the enlace_url requested" do
      EnlaceUrl.should_receive(:find).and_return(@enlace_url)
      do_get
    end
  
    it "should assign the found EnlaceUrl for the view" do
      do_get
      assigns[:enlace_url].should equal(@enlace_url)
    end
  end

  describe "handling POST /enlace_urls" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl, :to_param => "1")
      EnlaceUrl.stub!(:new).and_return(@enlace_url)
    end
    
    describe "with successful save" do
  
      def do_post
        @enlace_url.should_receive(:save).and_return(true)
        post :create, :enlace_url => {}
      end
  
      it "should create a new enlace_url" do
        EnlaceUrl.should_receive(:new).with({}).and_return(@enlace_url)
        do_post
      end

      it "should redirect to the new enlace_url" do
        do_post
        response.should redirect_to(enlace_url_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @enlace_url.should_receive(:save).and_return(false)
        post :create, :enlace_url => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /enlace_urls/1" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl, :to_param => "1")
      EnlaceUrl.stub!(:find).and_return(@enlace_url)
    end
    
    describe "with successful update" do

      def do_put
        @enlace_url.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the enlace_url requested" do
        EnlaceUrl.should_receive(:find).with("1").and_return(@enlace_url)
        do_put
      end

      it "should update the found enlace_url" do
        do_put
        assigns(:enlace_url).should equal(@enlace_url)
      end

      it "should assign the found enlace_url for the view" do
        do_put
        assigns(:enlace_url).should equal(@enlace_url)
      end

      it "should redirect to the enlace_url" do
        do_put
        response.should redirect_to(enlace_url_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @enlace_url.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /enlace_urls/1" do

    before(:each) do
      @enlace_url = mock_model(EnlaceUrl, :destroy => true)
      EnlaceUrl.stub!(:find).and_return(@enlace_url)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the enlace_url requested" do
      EnlaceUrl.should_receive(:find).with("1").and_return(@enlace_url)
      do_delete
    end
  
    it "should call destroy on the found enlace_url" do
      @enlace_url.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the enlace_urls list" do
      do_delete
      response.should redirect_to(enlace_urls_url)
    end
  end
end