require File.dirname(__FILE__) + '/../spec_helper'

describe PaisesController do
  describe "handling GET /paises" do

    before(:each) do
      @paise = mock_model(Paise)
      Paise.stub!(:find).and_return([@paise])
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
  
    it "should find all paises" do
      Paise.should_receive(:find).with(:all).and_return([@paise])
      do_get
    end
  
    it "should assign the found paises for the view" do
      do_get
      assigns[:paises].should == [@paise]
    end
  end

  describe "handling GET /paises.xml" do

    before(:each) do
      @paise = mock_model(Paise, :to_xml => "XML")
      Paise.stub!(:find).and_return(@paise)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all paises" do
      Paise.should_receive(:find).with(:all).and_return([@paise])
      do_get
    end
  
    it "should render the found paises as xml" do
      @paise.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /paises/1" do

    before(:each) do
      @paise = mock_model(Paise)
      Paise.stub!(:find).and_return(@paise)
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
  
    it "should find the paise requested" do
      Paise.should_receive(:find).with("1").and_return(@paise)
      do_get
    end
  
    it "should assign the found paise for the view" do
      do_get
      assigns[:paise].should equal(@paise)
    end
  end

  describe "handling GET /paises/1.xml" do

    before(:each) do
      @paise = mock_model(Paise, :to_xml => "XML")
      Paise.stub!(:find).and_return(@paise)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the paise requested" do
      Paise.should_receive(:find).with("1").and_return(@paise)
      do_get
    end
  
    it "should render the found paise as xml" do
      @paise.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /paises/new" do

    before(:each) do
      @paise = mock_model(Paise)
      Paise.stub!(:new).and_return(@paise)
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
  
    it "should create an new paise" do
      Paise.should_receive(:new).and_return(@paise)
      do_get
    end
  
    it "should not save the new paise" do
      @paise.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new paise for the view" do
      do_get
      assigns[:paise].should equal(@paise)
    end
  end

  describe "handling GET /paises/1/edit" do

    before(:each) do
      @paise = mock_model(Paise)
      Paise.stub!(:find).and_return(@paise)
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
  
    it "should find the paise requested" do
      Paise.should_receive(:find).and_return(@paise)
      do_get
    end
  
    it "should assign the found Paise for the view" do
      do_get
      assigns[:paise].should equal(@paise)
    end
  end

  describe "handling POST /paises" do

    before(:each) do
      @paise = mock_model(Paise, :to_param => "1")
      Paise.stub!(:new).and_return(@paise)
    end
    
    describe "with successful save" do
  
      def do_post
        @paise.should_receive(:save).and_return(true)
        post :create, :paise => {}
      end
  
      it "should create a new paise" do
        Paise.should_receive(:new).with({}).and_return(@paise)
        do_post
      end

      it "should redirect to the new paise" do
        do_post
        response.should redirect_to(paise_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @paise.should_receive(:save).and_return(false)
        post :create, :paise => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /paises/1" do

    before(:each) do
      @paise = mock_model(Paise, :to_param => "1")
      Paise.stub!(:find).and_return(@paise)
    end
    
    describe "with successful update" do

      def do_put
        @paise.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the paise requested" do
        Paise.should_receive(:find).with("1").and_return(@paise)
        do_put
      end

      it "should update the found paise" do
        do_put
        assigns(:paise).should equal(@paise)
      end

      it "should assign the found paise for the view" do
        do_put
        assigns(:paise).should equal(@paise)
      end

      it "should redirect to the paise" do
        do_put
        response.should redirect_to(paise_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @paise.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /paises/1" do

    before(:each) do
      @paise = mock_model(Paise, :destroy => true)
      Paise.stub!(:find).and_return(@paise)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the paise requested" do
      Paise.should_receive(:find).with("1").and_return(@paise)
      do_delete
    end
  
    it "should call destroy on the found paise" do
      @paise.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the paises list" do
      do_delete
      response.should redirect_to(paises_url)
    end
  end
end