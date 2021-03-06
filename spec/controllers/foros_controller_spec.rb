require File.dirname(__FILE__) + '/../spec_helper'

describe ForosController do
  describe "handling GET /foros" do

    before(:each) do
      @foro = mock_model(Foro)
      Foro.stub!(:find).and_return([@foro])
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
  
    it "should find all foros" do
      Foro.should_receive(:find).with(:all).and_return([@foro])
      do_get
    end
  
    it "should assign the found foros for the view" do
      do_get
      assigns[:foros].should == [@foro]
    end
  end

  describe "handling GET /foros.xml" do

    before(:each) do
      @foro = mock_model(Foro, :to_xml => "XML")
      Foro.stub!(:find).and_return(@foro)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all foros" do
      Foro.should_receive(:find).with(:all).and_return([@foro])
      do_get
    end
  
    it "should render the found foros as xml" do
      @foro.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /foros/1" do

    before(:each) do
      @foro = mock_model(Foro)
      Foro.stub!(:find).and_return(@foro)
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
  
    it "should find the foro requested" do
      Foro.should_receive(:find).with("1").and_return(@foro)
      do_get
    end
  
    it "should assign the found foro for the view" do
      do_get
      assigns[:foro].should equal(@foro)
    end
  end

  describe "handling GET /foros/1.xml" do

    before(:each) do
      @foro = mock_model(Foro, :to_xml => "XML")
      Foro.stub!(:find).and_return(@foro)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the foro requested" do
      Foro.should_receive(:find).with("1").and_return(@foro)
      do_get
    end
  
    it "should render the found foro as xml" do
      @foro.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /foros/new" do

    before(:each) do
      @foro = mock_model(Foro)
      Foro.stub!(:new).and_return(@foro)
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
  
    it "should create an new foro" do
      Foro.should_receive(:new).and_return(@foro)
      do_get
    end
  
    it "should not save the new foro" do
      @foro.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new foro for the view" do
      do_get
      assigns[:foro].should equal(@foro)
    end
  end

  describe "handling GET /foros/1/edit" do

    before(:each) do
      @foro = mock_model(Foro)
      Foro.stub!(:find).and_return(@foro)
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
  
    it "should find the foro requested" do
      Foro.should_receive(:find).and_return(@foro)
      do_get
    end
  
    it "should assign the found Foro for the view" do
      do_get
      assigns[:foro].should equal(@foro)
    end
  end

  describe "handling POST /foros" do

    before(:each) do
      @foro = mock_model(Foro, :to_param => "1")
      Foro.stub!(:new).and_return(@foro)
    end
    
    describe "with successful save" do
  
      def do_post
        @foro.should_receive(:save).and_return(true)
        post :create, :foro => {}
      end
  
      it "should create a new foro" do
        Foro.should_receive(:new).with({}).and_return(@foro)
        do_post
      end

      it "should redirect to the new foro" do
        do_post
        response.should redirect_to(foro_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @foro.should_receive(:save).and_return(false)
        post :create, :foro => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /foros/1" do

    before(:each) do
      @foro = mock_model(Foro, :to_param => "1")
      Foro.stub!(:find).and_return(@foro)
    end
    
    describe "with successful update" do

      def do_put
        @foro.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the foro requested" do
        Foro.should_receive(:find).with("1").and_return(@foro)
        do_put
      end

      it "should update the found foro" do
        do_put
        assigns(:foro).should equal(@foro)
      end

      it "should assign the found foro for the view" do
        do_put
        assigns(:foro).should equal(@foro)
      end

      it "should redirect to the foro" do
        do_put
        response.should redirect_to(foro_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @foro.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /foros/1" do

    before(:each) do
      @foro = mock_model(Foro, :destroy => true)
      Foro.stub!(:find).and_return(@foro)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the foro requested" do
      Foro.should_receive(:find).with("1").and_return(@foro)
      do_delete
    end
  
    it "should call destroy on the found foro" do
      @foro.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the foros list" do
      do_delete
      response.should redirect_to(foros_url)
    end
  end
end