require File.dirname(__FILE__) + '/../spec_helper'

describe PeriodistasController do
  describe "handling GET /periodistas" do

    before(:each) do
      @periodista = mock_model(Periodista)
      Periodista.stub!(:find).and_return([@periodista])
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
  
    it "should find all periodistas" do
      Periodista.should_receive(:find).with(:all).and_return([@periodista])
      do_get
    end
  
    it "should assign the found periodistas for the view" do
      do_get
      assigns[:periodistas].should == [@periodista]
    end
  end

  describe "handling GET /periodistas.xml" do

    before(:each) do
      @periodista = mock_model(Periodista, :to_xml => "XML")
      Periodista.stub!(:find).and_return(@periodista)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all periodistas" do
      Periodista.should_receive(:find).with(:all).and_return([@periodista])
      do_get
    end
  
    it "should render the found periodistas as xml" do
      @periodista.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /periodistas/1" do

    before(:each) do
      @periodista = mock_model(Periodista)
      Periodista.stub!(:find).and_return(@periodista)
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
  
    it "should find the periodista requested" do
      Periodista.should_receive(:find).with("1").and_return(@periodista)
      do_get
    end
  
    it "should assign the found periodista for the view" do
      do_get
      assigns[:periodista].should equal(@periodista)
    end
  end

  describe "handling GET /periodistas/1.xml" do

    before(:each) do
      @periodista = mock_model(Periodista, :to_xml => "XML")
      Periodista.stub!(:find).and_return(@periodista)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the periodista requested" do
      Periodista.should_receive(:find).with("1").and_return(@periodista)
      do_get
    end
  
    it "should render the found periodista as xml" do
      @periodista.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /periodistas/new" do

    before(:each) do
      @periodista = mock_model(Periodista)
      Periodista.stub!(:new).and_return(@periodista)
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
  
    it "should create an new periodista" do
      Periodista.should_receive(:new).and_return(@periodista)
      do_get
    end
  
    it "should not save the new periodista" do
      @periodista.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new periodista for the view" do
      do_get
      assigns[:periodista].should equal(@periodista)
    end
  end

  describe "handling GET /periodistas/1/edit" do

    before(:each) do
      @periodista = mock_model(Periodista)
      Periodista.stub!(:find).and_return(@periodista)
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
  
    it "should find the periodista requested" do
      Periodista.should_receive(:find).and_return(@periodista)
      do_get
    end
  
    it "should assign the found Periodista for the view" do
      do_get
      assigns[:periodista].should equal(@periodista)
    end
  end

  describe "handling POST /periodistas" do

    before(:each) do
      @periodista = mock_model(Periodista, :to_param => "1")
      Periodista.stub!(:new).and_return(@periodista)
    end
    
    describe "with successful save" do
  
      def do_post
        @periodista.should_receive(:save).and_return(true)
        post :create, :periodista => {}
      end
  
      it "should create a new periodista" do
        Periodista.should_receive(:new).with({}).and_return(@periodista)
        do_post
      end

      it "should redirect to the new periodista" do
        do_post
        response.should redirect_to(periodista_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @periodista.should_receive(:save).and_return(false)
        post :create, :periodista => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /periodistas/1" do

    before(:each) do
      @periodista = mock_model(Periodista, :to_param => "1")
      Periodista.stub!(:find).and_return(@periodista)
    end
    
    describe "with successful update" do

      def do_put
        @periodista.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the periodista requested" do
        Periodista.should_receive(:find).with("1").and_return(@periodista)
        do_put
      end

      it "should update the found periodista" do
        do_put
        assigns(:periodista).should equal(@periodista)
      end

      it "should assign the found periodista for the view" do
        do_put
        assigns(:periodista).should equal(@periodista)
      end

      it "should redirect to the periodista" do
        do_put
        response.should redirect_to(periodista_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @periodista.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /periodistas/1" do

    before(:each) do
      @periodista = mock_model(Periodista, :destroy => true)
      Periodista.stub!(:find).and_return(@periodista)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the periodista requested" do
      Periodista.should_receive(:find).with("1").and_return(@periodista)
      do_delete
    end
  
    it "should call destroy on the found periodista" do
      @periodista.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the periodistas list" do
      do_delete
      response.should redirect_to(periodistas_url)
    end
  end
end