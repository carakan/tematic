require File.dirname(__FILE__) + '/../spec_helper'

describe MinisteriosController do
  describe "handling GET /ministerios" do

    before(:each) do
      @ministerio = mock_model(Ministerio)
      Ministerio.stub!(:find).and_return([@ministerio])
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
  
    it "should find all ministerios" do
      Ministerio.should_receive(:find).with(:all).and_return([@ministerio])
      do_get
    end
  
    it "should assign the found ministerios for the view" do
      do_get
      assigns[:ministerios].should == [@ministerio]
    end
  end

  describe "handling GET /ministerios.xml" do

    before(:each) do
      @ministerio = mock_model(Ministerio, :to_xml => "XML")
      Ministerio.stub!(:find).and_return(@ministerio)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all ministerios" do
      Ministerio.should_receive(:find).with(:all).and_return([@ministerio])
      do_get
    end
  
    it "should render the found ministerios as xml" do
      @ministerio.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /ministerios/1" do

    before(:each) do
      @ministerio = mock_model(Ministerio)
      Ministerio.stub!(:find).and_return(@ministerio)
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
  
    it "should find the ministerio requested" do
      Ministerio.should_receive(:find).with("1").and_return(@ministerio)
      do_get
    end
  
    it "should assign the found ministerio for the view" do
      do_get
      assigns[:ministerio].should equal(@ministerio)
    end
  end

  describe "handling GET /ministerios/1.xml" do

    before(:each) do
      @ministerio = mock_model(Ministerio, :to_xml => "XML")
      Ministerio.stub!(:find).and_return(@ministerio)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the ministerio requested" do
      Ministerio.should_receive(:find).with("1").and_return(@ministerio)
      do_get
    end
  
    it "should render the found ministerio as xml" do
      @ministerio.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /ministerios/new" do

    before(:each) do
      @ministerio = mock_model(Ministerio)
      Ministerio.stub!(:new).and_return(@ministerio)
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
  
    it "should create an new ministerio" do
      Ministerio.should_receive(:new).and_return(@ministerio)
      do_get
    end
  
    it "should not save the new ministerio" do
      @ministerio.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new ministerio for the view" do
      do_get
      assigns[:ministerio].should equal(@ministerio)
    end
  end

  describe "handling GET /ministerios/1/edit" do

    before(:each) do
      @ministerio = mock_model(Ministerio)
      Ministerio.stub!(:find).and_return(@ministerio)
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
  
    it "should find the ministerio requested" do
      Ministerio.should_receive(:find).and_return(@ministerio)
      do_get
    end
  
    it "should assign the found Ministerio for the view" do
      do_get
      assigns[:ministerio].should equal(@ministerio)
    end
  end

  describe "handling POST /ministerios" do

    before(:each) do
      @ministerio = mock_model(Ministerio, :to_param => "1")
      Ministerio.stub!(:new).and_return(@ministerio)
    end
    
    describe "with successful save" do
  
      def do_post
        @ministerio.should_receive(:save).and_return(true)
        post :create, :ministerio => {}
      end
  
      it "should create a new ministerio" do
        Ministerio.should_receive(:new).with({}).and_return(@ministerio)
        do_post
      end

      it "should redirect to the new ministerio" do
        do_post
        response.should redirect_to(ministerio_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @ministerio.should_receive(:save).and_return(false)
        post :create, :ministerio => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /ministerios/1" do

    before(:each) do
      @ministerio = mock_model(Ministerio, :to_param => "1")
      Ministerio.stub!(:find).and_return(@ministerio)
    end
    
    describe "with successful update" do

      def do_put
        @ministerio.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the ministerio requested" do
        Ministerio.should_receive(:find).with("1").and_return(@ministerio)
        do_put
      end

      it "should update the found ministerio" do
        do_put
        assigns(:ministerio).should equal(@ministerio)
      end

      it "should assign the found ministerio for the view" do
        do_put
        assigns(:ministerio).should equal(@ministerio)
      end

      it "should redirect to the ministerio" do
        do_put
        response.should redirect_to(ministerio_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @ministerio.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /ministerios/1" do

    before(:each) do
      @ministerio = mock_model(Ministerio, :destroy => true)
      Ministerio.stub!(:find).and_return(@ministerio)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the ministerio requested" do
      Ministerio.should_receive(:find).with("1").and_return(@ministerio)
      do_delete
    end
  
    it "should call destroy on the found ministerio" do
      @ministerio.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the ministerios list" do
      do_delete
      response.should redirect_to(ministerios_url)
    end
  end
end