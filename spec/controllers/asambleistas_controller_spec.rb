require File.dirname(__FILE__) + '/../spec_helper'

describe AsambleistasController do
  describe "handling GET /asambleistas" do

    before(:each) do
      @asambleista = mock_model(Asambleista)
      Asambleista.stub!(:find).and_return([@asambleista])
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
  
    it "should find all asambleistas" do
      Asambleista.should_receive(:find).with(:all).and_return([@asambleista])
      do_get
    end
  
    it "should assign the found asambleistas for the view" do
      do_get
      assigns[:asambleistas].should == [@asambleista]
    end
  end

  describe "handling GET /asambleistas.xml" do

    before(:each) do
      @asambleista = mock_model(Asambleista, :to_xml => "XML")
      Asambleista.stub!(:find).and_return(@asambleista)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all asambleistas" do
      Asambleista.should_receive(:find).with(:all).and_return([@asambleista])
      do_get
    end
  
    it "should render the found asambleistas as xml" do
      @asambleista.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /asambleistas/1" do

    before(:each) do
      @asambleista = mock_model(Asambleista)
      Asambleista.stub!(:find).and_return(@asambleista)
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
  
    it "should find the asambleista requested" do
      Asambleista.should_receive(:find).with("1").and_return(@asambleista)
      do_get
    end
  
    it "should assign the found asambleista for the view" do
      do_get
      assigns[:asambleista].should equal(@asambleista)
    end
  end

  describe "handling GET /asambleistas/1.xml" do

    before(:each) do
      @asambleista = mock_model(Asambleista, :to_xml => "XML")
      Asambleista.stub!(:find).and_return(@asambleista)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the asambleista requested" do
      Asambleista.should_receive(:find).with("1").and_return(@asambleista)
      do_get
    end
  
    it "should render the found asambleista as xml" do
      @asambleista.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /asambleistas/new" do

    before(:each) do
      @asambleista = mock_model(Asambleista)
      Asambleista.stub!(:new).and_return(@asambleista)
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
  
    it "should create an new asambleista" do
      Asambleista.should_receive(:new).and_return(@asambleista)
      do_get
    end
  
    it "should not save the new asambleista" do
      @asambleista.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new asambleista for the view" do
      do_get
      assigns[:asambleista].should equal(@asambleista)
    end
  end

  describe "handling GET /asambleistas/1/edit" do

    before(:each) do
      @asambleista = mock_model(Asambleista)
      Asambleista.stub!(:find).and_return(@asambleista)
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
  
    it "should find the asambleista requested" do
      Asambleista.should_receive(:find).and_return(@asambleista)
      do_get
    end
  
    it "should assign the found Asambleista for the view" do
      do_get
      assigns[:asambleista].should equal(@asambleista)
    end
  end

  describe "handling POST /asambleistas" do

    before(:each) do
      @asambleista = mock_model(Asambleista, :to_param => "1")
      Asambleista.stub!(:new).and_return(@asambleista)
    end
    
    describe "with successful save" do
  
      def do_post
        @asambleista.should_receive(:save).and_return(true)
        post :create, :asambleista => {}
      end
  
      it "should create a new asambleista" do
        Asambleista.should_receive(:new).with({}).and_return(@asambleista)
        do_post
      end

      it "should redirect to the new asambleista" do
        do_post
        response.should redirect_to(asambleista_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @asambleista.should_receive(:save).and_return(false)
        post :create, :asambleista => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /asambleistas/1" do

    before(:each) do
      @asambleista = mock_model(Asambleista, :to_param => "1")
      Asambleista.stub!(:find).and_return(@asambleista)
    end
    
    describe "with successful update" do

      def do_put
        @asambleista.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the asambleista requested" do
        Asambleista.should_receive(:find).with("1").and_return(@asambleista)
        do_put
      end

      it "should update the found asambleista" do
        do_put
        assigns(:asambleista).should equal(@asambleista)
      end

      it "should assign the found asambleista for the view" do
        do_put
        assigns(:asambleista).should equal(@asambleista)
      end

      it "should redirect to the asambleista" do
        do_put
        response.should redirect_to(asambleista_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @asambleista.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /asambleistas/1" do

    before(:each) do
      @asambleista = mock_model(Asambleista, :destroy => true)
      Asambleista.stub!(:find).and_return(@asambleista)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the asambleista requested" do
      Asambleista.should_receive(:find).with("1").and_return(@asambleista)
      do_delete
    end
  
    it "should call destroy on the found asambleista" do
      @asambleista.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the asambleistas list" do
      do_delete
      response.should redirect_to(asambleistas_url)
    end
  end
end