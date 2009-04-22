require File.dirname(__FILE__) + '/../spec_helper'

describe MunicipiosController do
  describe "handling GET /municipios" do

    before(:each) do
      @municipio = mock_model(Municipio)
      Municipio.stub!(:find).and_return([@municipio])
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
  
    it "should find all municipios" do
      Municipio.should_receive(:find).with(:all).and_return([@municipio])
      do_get
    end
  
    it "should assign the found municipios for the view" do
      do_get
      assigns[:municipios].should == [@municipio]
    end
  end

  describe "handling GET /municipios.xml" do

    before(:each) do
      @municipio = mock_model(Municipio, :to_xml => "XML")
      Municipio.stub!(:find).and_return(@municipio)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all municipios" do
      Municipio.should_receive(:find).with(:all).and_return([@municipio])
      do_get
    end
  
    it "should render the found municipios as xml" do
      @municipio.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /municipios/1" do

    before(:each) do
      @municipio = mock_model(Municipio)
      Municipio.stub!(:find).and_return(@municipio)
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
  
    it "should find the municipio requested" do
      Municipio.should_receive(:find).with("1").and_return(@municipio)
      do_get
    end
  
    it "should assign the found municipio for the view" do
      do_get
      assigns[:municipio].should equal(@municipio)
    end
  end

  describe "handling GET /municipios/1.xml" do

    before(:each) do
      @municipio = mock_model(Municipio, :to_xml => "XML")
      Municipio.stub!(:find).and_return(@municipio)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the municipio requested" do
      Municipio.should_receive(:find).with("1").and_return(@municipio)
      do_get
    end
  
    it "should render the found municipio as xml" do
      @municipio.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /municipios/new" do

    before(:each) do
      @municipio = mock_model(Municipio)
      Municipio.stub!(:new).and_return(@municipio)
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
  
    it "should create an new municipio" do
      Municipio.should_receive(:new).and_return(@municipio)
      do_get
    end
  
    it "should not save the new municipio" do
      @municipio.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new municipio for the view" do
      do_get
      assigns[:municipio].should equal(@municipio)
    end
  end

  describe "handling GET /municipios/1/edit" do

    before(:each) do
      @municipio = mock_model(Municipio)
      Municipio.stub!(:find).and_return(@municipio)
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
  
    it "should find the municipio requested" do
      Municipio.should_receive(:find).and_return(@municipio)
      do_get
    end
  
    it "should assign the found Municipio for the view" do
      do_get
      assigns[:municipio].should equal(@municipio)
    end
  end

  describe "handling POST /municipios" do

    before(:each) do
      @municipio = mock_model(Municipio, :to_param => "1")
      Municipio.stub!(:new).and_return(@municipio)
    end
    
    describe "with successful save" do
  
      def do_post
        @municipio.should_receive(:save).and_return(true)
        post :create, :municipio => {}
      end
  
      it "should create a new municipio" do
        Municipio.should_receive(:new).with({}).and_return(@municipio)
        do_post
      end

      it "should redirect to the new municipio" do
        do_post
        response.should redirect_to(municipio_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @municipio.should_receive(:save).and_return(false)
        post :create, :municipio => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /municipios/1" do

    before(:each) do
      @municipio = mock_model(Municipio, :to_param => "1")
      Municipio.stub!(:find).and_return(@municipio)
    end
    
    describe "with successful update" do

      def do_put
        @municipio.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the municipio requested" do
        Municipio.should_receive(:find).with("1").and_return(@municipio)
        do_put
      end

      it "should update the found municipio" do
        do_put
        assigns(:municipio).should equal(@municipio)
      end

      it "should assign the found municipio for the view" do
        do_put
        assigns(:municipio).should equal(@municipio)
      end

      it "should redirect to the municipio" do
        do_put
        response.should redirect_to(municipio_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @municipio.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /municipios/1" do

    before(:each) do
      @municipio = mock_model(Municipio, :destroy => true)
      Municipio.stub!(:find).and_return(@municipio)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the municipio requested" do
      Municipio.should_receive(:find).with("1").and_return(@municipio)
      do_delete
    end
  
    it "should call destroy on the found municipio" do
      @municipio.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the municipios list" do
      do_delete
      response.should redirect_to(municipios_url)
    end
  end
end