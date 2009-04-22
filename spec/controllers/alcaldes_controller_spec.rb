require File.dirname(__FILE__) + '/../spec_helper'

describe AlcaldesController do
  describe "handling GET /alcaldes" do

    before(:each) do
      @alcalde = mock_model(Alcalde)
      Alcalde.stub!(:find).and_return([@alcalde])
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
  
    it "should find all alcaldes" do
      Alcalde.should_receive(:find).with(:all).and_return([@alcalde])
      do_get
    end
  
    it "should assign the found alcaldes for the view" do
      do_get
      assigns[:alcaldes].should == [@alcalde]
    end
  end

  describe "handling GET /alcaldes.xml" do

    before(:each) do
      @alcalde = mock_model(Alcalde, :to_xml => "XML")
      Alcalde.stub!(:find).and_return(@alcalde)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all alcaldes" do
      Alcalde.should_receive(:find).with(:all).and_return([@alcalde])
      do_get
    end
  
    it "should render the found alcaldes as xml" do
      @alcalde.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /alcaldes/1" do

    before(:each) do
      @alcalde = mock_model(Alcalde)
      Alcalde.stub!(:find).and_return(@alcalde)
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
  
    it "should find the alcalde requested" do
      Alcalde.should_receive(:find).with("1").and_return(@alcalde)
      do_get
    end
  
    it "should assign the found alcalde for the view" do
      do_get
      assigns[:alcalde].should equal(@alcalde)
    end
  end

  describe "handling GET /alcaldes/1.xml" do

    before(:each) do
      @alcalde = mock_model(Alcalde, :to_xml => "XML")
      Alcalde.stub!(:find).and_return(@alcalde)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the alcalde requested" do
      Alcalde.should_receive(:find).with("1").and_return(@alcalde)
      do_get
    end
  
    it "should render the found alcalde as xml" do
      @alcalde.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /alcaldes/new" do

    before(:each) do
      @alcalde = mock_model(Alcalde)
      Alcalde.stub!(:new).and_return(@alcalde)
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
  
    it "should create an new alcalde" do
      Alcalde.should_receive(:new).and_return(@alcalde)
      do_get
    end
  
    it "should not save the new alcalde" do
      @alcalde.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new alcalde for the view" do
      do_get
      assigns[:alcalde].should equal(@alcalde)
    end
  end

  describe "handling GET /alcaldes/1/edit" do

    before(:each) do
      @alcalde = mock_model(Alcalde)
      Alcalde.stub!(:find).and_return(@alcalde)
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
  
    it "should find the alcalde requested" do
      Alcalde.should_receive(:find).and_return(@alcalde)
      do_get
    end
  
    it "should assign the found Alcalde for the view" do
      do_get
      assigns[:alcalde].should equal(@alcalde)
    end
  end

  describe "handling POST /alcaldes" do

    before(:each) do
      @alcalde = mock_model(Alcalde, :to_param => "1")
      Alcalde.stub!(:new).and_return(@alcalde)
    end
    
    describe "with successful save" do
  
      def do_post
        @alcalde.should_receive(:save).and_return(true)
        post :create, :alcalde => {}
      end
  
      it "should create a new alcalde" do
        Alcalde.should_receive(:new).with({}).and_return(@alcalde)
        do_post
      end

      it "should redirect to the new alcalde" do
        do_post
        response.should redirect_to(alcalde_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @alcalde.should_receive(:save).and_return(false)
        post :create, :alcalde => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /alcaldes/1" do

    before(:each) do
      @alcalde = mock_model(Alcalde, :to_param => "1")
      Alcalde.stub!(:find).and_return(@alcalde)
    end
    
    describe "with successful update" do

      def do_put
        @alcalde.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the alcalde requested" do
        Alcalde.should_receive(:find).with("1").and_return(@alcalde)
        do_put
      end

      it "should update the found alcalde" do
        do_put
        assigns(:alcalde).should equal(@alcalde)
      end

      it "should assign the found alcalde for the view" do
        do_put
        assigns(:alcalde).should equal(@alcalde)
      end

      it "should redirect to the alcalde" do
        do_put
        response.should redirect_to(alcalde_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @alcalde.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /alcaldes/1" do

    before(:each) do
      @alcalde = mock_model(Alcalde, :destroy => true)
      Alcalde.stub!(:find).and_return(@alcalde)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the alcalde requested" do
      Alcalde.should_receive(:find).with("1").and_return(@alcalde)
      do_delete
    end
  
    it "should call destroy on the found alcalde" do
      @alcalde.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the alcaldes list" do
      do_delete
      response.should redirect_to(alcaldes_url)
    end
  end
end