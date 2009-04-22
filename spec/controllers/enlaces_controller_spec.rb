require File.dirname(__FILE__) + '/../spec_helper'

describe EnlacesController do
  describe "handling GET /enlaces" do

    before(:each) do
      @enlace = mock_model(Enlace)
      Enlace.stub!(:find).and_return([@enlace])
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
  
    it "should find all enlaces" do
      Enlace.should_receive(:find).with(:all).and_return([@enlace])
      do_get
    end
  
    it "should assign the found enlaces for the view" do
      do_get
      assigns[:enlaces].should == [@enlace]
    end
  end

  describe "handling GET /enlaces.xml" do

    before(:each) do
      @enlace = mock_model(Enlace, :to_xml => "XML")
      Enlace.stub!(:find).and_return(@enlace)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all enlaces" do
      Enlace.should_receive(:find).with(:all).and_return([@enlace])
      do_get
    end
  
    it "should render the found enlaces as xml" do
      @enlace.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /enlaces/1" do

    before(:each) do
      @enlace = mock_model(Enlace)
      Enlace.stub!(:find).and_return(@enlace)
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
  
    it "should find the enlace requested" do
      Enlace.should_receive(:find).with("1").and_return(@enlace)
      do_get
    end
  
    it "should assign the found enlace for the view" do
      do_get
      assigns[:enlace].should equal(@enlace)
    end
  end

  describe "handling GET /enlaces/1.xml" do

    before(:each) do
      @enlace = mock_model(Enlace, :to_xml => "XML")
      Enlace.stub!(:find).and_return(@enlace)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the enlace requested" do
      Enlace.should_receive(:find).with("1").and_return(@enlace)
      do_get
    end
  
    it "should render the found enlace as xml" do
      @enlace.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /enlaces/new" do

    before(:each) do
      @enlace = mock_model(Enlace)
      Enlace.stub!(:new).and_return(@enlace)
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
  
    it "should create an new enlace" do
      Enlace.should_receive(:new).and_return(@enlace)
      do_get
    end
  
    it "should not save the new enlace" do
      @enlace.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new enlace for the view" do
      do_get
      assigns[:enlace].should equal(@enlace)
    end
  end

  describe "handling GET /enlaces/1/edit" do

    before(:each) do
      @enlace = mock_model(Enlace)
      Enlace.stub!(:find).and_return(@enlace)
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
  
    it "should find the enlace requested" do
      Enlace.should_receive(:find).and_return(@enlace)
      do_get
    end
  
    it "should assign the found Enlace for the view" do
      do_get
      assigns[:enlace].should equal(@enlace)
    end
  end

  describe "handling POST /enlaces" do

    before(:each) do
      @enlace = mock_model(Enlace, :to_param => "1")
      Enlace.stub!(:new).and_return(@enlace)
    end
    
    describe "with successful save" do
  
      def do_post
        @enlace.should_receive(:save).and_return(true)
        post :create, :enlace => {}
      end
  
      it "should create a new enlace" do
        Enlace.should_receive(:new).with({}).and_return(@enlace)
        do_post
      end

      it "should redirect to the new enlace" do
        do_post
        response.should redirect_to(enlace_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @enlace.should_receive(:save).and_return(false)
        post :create, :enlace => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /enlaces/1" do

    before(:each) do
      @enlace = mock_model(Enlace, :to_param => "1")
      Enlace.stub!(:find).and_return(@enlace)
    end
    
    describe "with successful update" do

      def do_put
        @enlace.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the enlace requested" do
        Enlace.should_receive(:find).with("1").and_return(@enlace)
        do_put
      end

      it "should update the found enlace" do
        do_put
        assigns(:enlace).should equal(@enlace)
      end

      it "should assign the found enlace for the view" do
        do_put
        assigns(:enlace).should equal(@enlace)
      end

      it "should redirect to the enlace" do
        do_put
        response.should redirect_to(enlace_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @enlace.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /enlaces/1" do

    before(:each) do
      @enlace = mock_model(Enlace, :destroy => true)
      Enlace.stub!(:find).and_return(@enlace)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the enlace requested" do
      Enlace.should_receive(:find).with("1").and_return(@enlace)
      do_delete
    end
  
    it "should call destroy on the found enlace" do
      @enlace.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the enlaces list" do
      do_delete
      response.should redirect_to(enlaces_url)
    end
  end
end