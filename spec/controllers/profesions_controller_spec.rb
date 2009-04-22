require File.dirname(__FILE__) + '/../spec_helper'

describe ProfesionsController do
  describe "handling GET /profesions" do

    before(:each) do
      @profesion = mock_model(Profesion)
      Profesion.stub!(:find).and_return([@profesion])
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
  
    it "should find all profesions" do
      Profesion.should_receive(:find).with(:all).and_return([@profesion])
      do_get
    end
  
    it "should assign the found profesions for the view" do
      do_get
      assigns[:profesions].should == [@profesion]
    end
  end

  describe "handling GET /profesions.xml" do

    before(:each) do
      @profesion = mock_model(Profesion, :to_xml => "XML")
      Profesion.stub!(:find).and_return(@profesion)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all profesions" do
      Profesion.should_receive(:find).with(:all).and_return([@profesion])
      do_get
    end
  
    it "should render the found profesions as xml" do
      @profesion.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /profesions/1" do

    before(:each) do
      @profesion = mock_model(Profesion)
      Profesion.stub!(:find).and_return(@profesion)
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
  
    it "should find the profesion requested" do
      Profesion.should_receive(:find).with("1").and_return(@profesion)
      do_get
    end
  
    it "should assign the found profesion for the view" do
      do_get
      assigns[:profesion].should equal(@profesion)
    end
  end

  describe "handling GET /profesions/1.xml" do

    before(:each) do
      @profesion = mock_model(Profesion, :to_xml => "XML")
      Profesion.stub!(:find).and_return(@profesion)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the profesion requested" do
      Profesion.should_receive(:find).with("1").and_return(@profesion)
      do_get
    end
  
    it "should render the found profesion as xml" do
      @profesion.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /profesions/new" do

    before(:each) do
      @profesion = mock_model(Profesion)
      Profesion.stub!(:new).and_return(@profesion)
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
  
    it "should create an new profesion" do
      Profesion.should_receive(:new).and_return(@profesion)
      do_get
    end
  
    it "should not save the new profesion" do
      @profesion.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new profesion for the view" do
      do_get
      assigns[:profesion].should equal(@profesion)
    end
  end

  describe "handling GET /profesions/1/edit" do

    before(:each) do
      @profesion = mock_model(Profesion)
      Profesion.stub!(:find).and_return(@profesion)
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
  
    it "should find the profesion requested" do
      Profesion.should_receive(:find).and_return(@profesion)
      do_get
    end
  
    it "should assign the found Profesion for the view" do
      do_get
      assigns[:profesion].should equal(@profesion)
    end
  end

  describe "handling POST /profesions" do

    before(:each) do
      @profesion = mock_model(Profesion, :to_param => "1")
      Profesion.stub!(:new).and_return(@profesion)
    end
    
    describe "with successful save" do
  
      def do_post
        @profesion.should_receive(:save).and_return(true)
        post :create, :profesion => {}
      end
  
      it "should create a new profesion" do
        Profesion.should_receive(:new).with({}).and_return(@profesion)
        do_post
      end

      it "should redirect to the new profesion" do
        do_post
        response.should redirect_to(profesion_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @profesion.should_receive(:save).and_return(false)
        post :create, :profesion => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /profesions/1" do

    before(:each) do
      @profesion = mock_model(Profesion, :to_param => "1")
      Profesion.stub!(:find).and_return(@profesion)
    end
    
    describe "with successful update" do

      def do_put
        @profesion.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the profesion requested" do
        Profesion.should_receive(:find).with("1").and_return(@profesion)
        do_put
      end

      it "should update the found profesion" do
        do_put
        assigns(:profesion).should equal(@profesion)
      end

      it "should assign the found profesion for the view" do
        do_put
        assigns(:profesion).should equal(@profesion)
      end

      it "should redirect to the profesion" do
        do_put
        response.should redirect_to(profesion_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @profesion.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /profesions/1" do

    before(:each) do
      @profesion = mock_model(Profesion, :destroy => true)
      Profesion.stub!(:find).and_return(@profesion)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the profesion requested" do
      Profesion.should_receive(:find).with("1").and_return(@profesion)
      do_delete
    end
  
    it "should call destroy on the found profesion" do
      @profesion.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the profesions list" do
      do_delete
      response.should redirect_to(profesions_url)
    end
  end
end