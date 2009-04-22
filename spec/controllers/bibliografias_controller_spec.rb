require File.dirname(__FILE__) + '/../spec_helper'

describe BibliografiasController do
  describe "handling GET /bibliografias" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia)
      Bibliografia.stub!(:find).and_return([@bibliografia])
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
  
    it "should find all bibliografias" do
      Bibliografia.should_receive(:find).with(:all).and_return([@bibliografia])
      do_get
    end
  
    it "should assign the found bibliografias for the view" do
      do_get
      assigns[:bibliografias].should == [@bibliografia]
    end
  end

  describe "handling GET /bibliografias.xml" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia, :to_xml => "XML")
      Bibliografia.stub!(:find).and_return(@bibliografia)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all bibliografias" do
      Bibliografia.should_receive(:find).with(:all).and_return([@bibliografia])
      do_get
    end
  
    it "should render the found bibliografias as xml" do
      @bibliografia.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /bibliografias/1" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia)
      Bibliografia.stub!(:find).and_return(@bibliografia)
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
  
    it "should find the bibliografia requested" do
      Bibliografia.should_receive(:find).with("1").and_return(@bibliografia)
      do_get
    end
  
    it "should assign the found bibliografia for the view" do
      do_get
      assigns[:bibliografia].should equal(@bibliografia)
    end
  end

  describe "handling GET /bibliografias/1.xml" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia, :to_xml => "XML")
      Bibliografia.stub!(:find).and_return(@bibliografia)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the bibliografia requested" do
      Bibliografia.should_receive(:find).with("1").and_return(@bibliografia)
      do_get
    end
  
    it "should render the found bibliografia as xml" do
      @bibliografia.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /bibliografias/new" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia)
      Bibliografia.stub!(:new).and_return(@bibliografia)
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
  
    it "should create an new bibliografia" do
      Bibliografia.should_receive(:new).and_return(@bibliografia)
      do_get
    end
  
    it "should not save the new bibliografia" do
      @bibliografia.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new bibliografia for the view" do
      do_get
      assigns[:bibliografia].should equal(@bibliografia)
    end
  end

  describe "handling GET /bibliografias/1/edit" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia)
      Bibliografia.stub!(:find).and_return(@bibliografia)
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
  
    it "should find the bibliografia requested" do
      Bibliografia.should_receive(:find).and_return(@bibliografia)
      do_get
    end
  
    it "should assign the found Bibliografia for the view" do
      do_get
      assigns[:bibliografia].should equal(@bibliografia)
    end
  end

  describe "handling POST /bibliografias" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia, :to_param => "1")
      Bibliografia.stub!(:new).and_return(@bibliografia)
    end
    
    describe "with successful save" do
  
      def do_post
        @bibliografia.should_receive(:save).and_return(true)
        post :create, :bibliografia => {}
      end
  
      it "should create a new bibliografia" do
        Bibliografia.should_receive(:new).with({}).and_return(@bibliografia)
        do_post
      end

      it "should redirect to the new bibliografia" do
        do_post
        response.should redirect_to(bibliografia_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @bibliografia.should_receive(:save).and_return(false)
        post :create, :bibliografia => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /bibliografias/1" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia, :to_param => "1")
      Bibliografia.stub!(:find).and_return(@bibliografia)
    end
    
    describe "with successful update" do

      def do_put
        @bibliografia.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the bibliografia requested" do
        Bibliografia.should_receive(:find).with("1").and_return(@bibliografia)
        do_put
      end

      it "should update the found bibliografia" do
        do_put
        assigns(:bibliografia).should equal(@bibliografia)
      end

      it "should assign the found bibliografia for the view" do
        do_put
        assigns(:bibliografia).should equal(@bibliografia)
      end

      it "should redirect to the bibliografia" do
        do_put
        response.should redirect_to(bibliografia_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @bibliografia.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /bibliografias/1" do

    before(:each) do
      @bibliografia = mock_model(Bibliografia, :destroy => true)
      Bibliografia.stub!(:find).and_return(@bibliografia)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the bibliografia requested" do
      Bibliografia.should_receive(:find).with("1").and_return(@bibliografia)
      do_delete
    end
  
    it "should call destroy on the found bibliografia" do
      @bibliografia.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the bibliografias list" do
      do_delete
      response.should redirect_to(bibliografias_url)
    end
  end
end