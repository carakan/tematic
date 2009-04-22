require File.dirname(__FILE__) + '/../spec_helper'

describe MultimediasController do
  describe "handling GET /multimedias" do

    before(:each) do
      @multimedia = mock_model(Multimedia)
      Multimedia.stub!(:find).and_return([@multimedia])
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
  
    it "should find all multimedias" do
      Multimedia.should_receive(:find).with(:all).and_return([@multimedia])
      do_get
    end
  
    it "should assign the found multimedias for the view" do
      do_get
      assigns[:multimedias].should == [@multimedia]
    end
  end

  describe "handling GET /multimedias.xml" do

    before(:each) do
      @multimedia = mock_model(Multimedia, :to_xml => "XML")
      Multimedia.stub!(:find).and_return(@multimedia)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all multimedias" do
      Multimedia.should_receive(:find).with(:all).and_return([@multimedia])
      do_get
    end
  
    it "should render the found multimedias as xml" do
      @multimedia.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /multimedias/1" do

    before(:each) do
      @multimedia = mock_model(Multimedia)
      Multimedia.stub!(:find).and_return(@multimedia)
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
  
    it "should find the multimedia requested" do
      Multimedia.should_receive(:find).with("1").and_return(@multimedia)
      do_get
    end
  
    it "should assign the found multimedia for the view" do
      do_get
      assigns[:multimedia].should equal(@multimedia)
    end
  end

  describe "handling GET /multimedias/1.xml" do

    before(:each) do
      @multimedia = mock_model(Multimedia, :to_xml => "XML")
      Multimedia.stub!(:find).and_return(@multimedia)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the multimedia requested" do
      Multimedia.should_receive(:find).with("1").and_return(@multimedia)
      do_get
    end
  
    it "should render the found multimedia as xml" do
      @multimedia.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /multimedias/new" do

    before(:each) do
      @multimedia = mock_model(Multimedia)
      Multimedia.stub!(:new).and_return(@multimedia)
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
  
    it "should create an new multimedia" do
      Multimedia.should_receive(:new).and_return(@multimedia)
      do_get
    end
  
    it "should not save the new multimedia" do
      @multimedia.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new multimedia for the view" do
      do_get
      assigns[:multimedia].should equal(@multimedia)
    end
  end

  describe "handling GET /multimedias/1/edit" do

    before(:each) do
      @multimedia = mock_model(Multimedia)
      Multimedia.stub!(:find).and_return(@multimedia)
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
  
    it "should find the multimedia requested" do
      Multimedia.should_receive(:find).and_return(@multimedia)
      do_get
    end
  
    it "should assign the found Multimedia for the view" do
      do_get
      assigns[:multimedia].should equal(@multimedia)
    end
  end

  describe "handling POST /multimedias" do

    before(:each) do
      @multimedia = mock_model(Multimedia, :to_param => "1")
      Multimedia.stub!(:new).and_return(@multimedia)
    end
    
    describe "with successful save" do
  
      def do_post
        @multimedia.should_receive(:save).and_return(true)
        post :create, :multimedia => {}
      end
  
      it "should create a new multimedia" do
        Multimedia.should_receive(:new).with({}).and_return(@multimedia)
        do_post
      end

      it "should redirect to the new multimedia" do
        do_post
        response.should redirect_to(multimedia_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @multimedia.should_receive(:save).and_return(false)
        post :create, :multimedia => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /multimedias/1" do

    before(:each) do
      @multimedia = mock_model(Multimedia, :to_param => "1")
      Multimedia.stub!(:find).and_return(@multimedia)
    end
    
    describe "with successful update" do

      def do_put
        @multimedia.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the multimedia requested" do
        Multimedia.should_receive(:find).with("1").and_return(@multimedia)
        do_put
      end

      it "should update the found multimedia" do
        do_put
        assigns(:multimedia).should equal(@multimedia)
      end

      it "should assign the found multimedia for the view" do
        do_put
        assigns(:multimedia).should equal(@multimedia)
      end

      it "should redirect to the multimedia" do
        do_put
        response.should redirect_to(multimedia_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @multimedia.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /multimedias/1" do

    before(:each) do
      @multimedia = mock_model(Multimedia, :destroy => true)
      Multimedia.stub!(:find).and_return(@multimedia)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the multimedia requested" do
      Multimedia.should_receive(:find).with("1").and_return(@multimedia)
      do_delete
    end
  
    it "should call destroy on the found multimedia" do
      @multimedia.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the multimedias list" do
      do_delete
      response.should redirect_to(multimedias_url)
    end
  end
end