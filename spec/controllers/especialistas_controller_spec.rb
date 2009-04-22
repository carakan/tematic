require File.dirname(__FILE__) + '/../spec_helper'

describe EspecialistasController do
  describe "handling GET /especialistas" do

    before(:each) do
      @especialista = mock_model(Especialista)
      Especialista.stub!(:find).and_return([@especialista])
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
  
    it "should find all especialistas" do
      Especialista.should_receive(:find).with(:all).and_return([@especialista])
      do_get
    end
  
    it "should assign the found especialistas for the view" do
      do_get
      assigns[:especialistas].should == [@especialista]
    end
  end

  describe "handling GET /especialistas.xml" do

    before(:each) do
      @especialista = mock_model(Especialista, :to_xml => "XML")
      Especialista.stub!(:find).and_return(@especialista)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all especialistas" do
      Especialista.should_receive(:find).with(:all).and_return([@especialista])
      do_get
    end
  
    it "should render the found especialistas as xml" do
      @especialista.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /especialistas/1" do

    before(:each) do
      @especialista = mock_model(Especialista)
      Especialista.stub!(:find).and_return(@especialista)
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
  
    it "should find the especialista requested" do
      Especialista.should_receive(:find).with("1").and_return(@especialista)
      do_get
    end
  
    it "should assign the found especialista for the view" do
      do_get
      assigns[:especialista].should equal(@especialista)
    end
  end

  describe "handling GET /especialistas/1.xml" do

    before(:each) do
      @especialista = mock_model(Especialista, :to_xml => "XML")
      Especialista.stub!(:find).and_return(@especialista)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the especialista requested" do
      Especialista.should_receive(:find).with("1").and_return(@especialista)
      do_get
    end
  
    it "should render the found especialista as xml" do
      @especialista.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /especialistas/new" do

    before(:each) do
      @especialista = mock_model(Especialista)
      Especialista.stub!(:new).and_return(@especialista)
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
  
    it "should create an new especialista" do
      Especialista.should_receive(:new).and_return(@especialista)
      do_get
    end
  
    it "should not save the new especialista" do
      @especialista.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new especialista for the view" do
      do_get
      assigns[:especialista].should equal(@especialista)
    end
  end

  describe "handling GET /especialistas/1/edit" do

    before(:each) do
      @especialista = mock_model(Especialista)
      Especialista.stub!(:find).and_return(@especialista)
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
  
    it "should find the especialista requested" do
      Especialista.should_receive(:find).and_return(@especialista)
      do_get
    end
  
    it "should assign the found Especialista for the view" do
      do_get
      assigns[:especialista].should equal(@especialista)
    end
  end

  describe "handling POST /especialistas" do

    before(:each) do
      @especialista = mock_model(Especialista, :to_param => "1")
      Especialista.stub!(:new).and_return(@especialista)
    end
    
    describe "with successful save" do
  
      def do_post
        @especialista.should_receive(:save).and_return(true)
        post :create, :especialista => {}
      end
  
      it "should create a new especialista" do
        Especialista.should_receive(:new).with({}).and_return(@especialista)
        do_post
      end

      it "should redirect to the new especialista" do
        do_post
        response.should redirect_to(especialista_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @especialista.should_receive(:save).and_return(false)
        post :create, :especialista => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /especialistas/1" do

    before(:each) do
      @especialista = mock_model(Especialista, :to_param => "1")
      Especialista.stub!(:find).and_return(@especialista)
    end
    
    describe "with successful update" do

      def do_put
        @especialista.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the especialista requested" do
        Especialista.should_receive(:find).with("1").and_return(@especialista)
        do_put
      end

      it "should update the found especialista" do
        do_put
        assigns(:especialista).should equal(@especialista)
      end

      it "should assign the found especialista for the view" do
        do_put
        assigns(:especialista).should equal(@especialista)
      end

      it "should redirect to the especialista" do
        do_put
        response.should redirect_to(especialista_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @especialista.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /especialistas/1" do

    before(:each) do
      @especialista = mock_model(Especialista, :destroy => true)
      Especialista.stub!(:find).and_return(@especialista)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the especialista requested" do
      Especialista.should_receive(:find).with("1").and_return(@especialista)
      do_delete
    end
  
    it "should call destroy on the found especialista" do
      @especialista.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the especialistas list" do
      do_delete
      response.should redirect_to(especialistas_url)
    end
  end
end