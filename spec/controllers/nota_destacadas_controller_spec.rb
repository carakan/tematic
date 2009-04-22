require File.dirname(__FILE__) + '/../spec_helper'

describe NotaDestacadasController do
  describe "handling GET /nota_destacadas" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada)
      NotaDestacada.stub!(:find).and_return([@nota_destacada])
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
  
    it "should find all nota_destacadas" do
      NotaDestacada.should_receive(:find).with(:all).and_return([@nota_destacada])
      do_get
    end
  
    it "should assign the found nota_destacadas for the view" do
      do_get
      assigns[:nota_destacadas].should == [@nota_destacada]
    end
  end

  describe "handling GET /nota_destacadas.xml" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada, :to_xml => "XML")
      NotaDestacada.stub!(:find).and_return(@nota_destacada)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all nota_destacadas" do
      NotaDestacada.should_receive(:find).with(:all).and_return([@nota_destacada])
      do_get
    end
  
    it "should render the found nota_destacadas as xml" do
      @nota_destacada.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /nota_destacadas/1" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada)
      NotaDestacada.stub!(:find).and_return(@nota_destacada)
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
  
    it "should find the nota_destacada requested" do
      NotaDestacada.should_receive(:find).with("1").and_return(@nota_destacada)
      do_get
    end
  
    it "should assign the found nota_destacada for the view" do
      do_get
      assigns[:nota_destacada].should equal(@nota_destacada)
    end
  end

  describe "handling GET /nota_destacadas/1.xml" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada, :to_xml => "XML")
      NotaDestacada.stub!(:find).and_return(@nota_destacada)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the nota_destacada requested" do
      NotaDestacada.should_receive(:find).with("1").and_return(@nota_destacada)
      do_get
    end
  
    it "should render the found nota_destacada as xml" do
      @nota_destacada.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /nota_destacadas/new" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada)
      NotaDestacada.stub!(:new).and_return(@nota_destacada)
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
  
    it "should create an new nota_destacada" do
      NotaDestacada.should_receive(:new).and_return(@nota_destacada)
      do_get
    end
  
    it "should not save the new nota_destacada" do
      @nota_destacada.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new nota_destacada for the view" do
      do_get
      assigns[:nota_destacada].should equal(@nota_destacada)
    end
  end

  describe "handling GET /nota_destacadas/1/edit" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada)
      NotaDestacada.stub!(:find).and_return(@nota_destacada)
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
  
    it "should find the nota_destacada requested" do
      NotaDestacada.should_receive(:find).and_return(@nota_destacada)
      do_get
    end
  
    it "should assign the found NotaDestacada for the view" do
      do_get
      assigns[:nota_destacada].should equal(@nota_destacada)
    end
  end

  describe "handling POST /nota_destacadas" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada, :to_param => "1")
      NotaDestacada.stub!(:new).and_return(@nota_destacada)
    end
    
    describe "with successful save" do
  
      def do_post
        @nota_destacada.should_receive(:save).and_return(true)
        post :create, :nota_destacada => {}
      end
  
      it "should create a new nota_destacada" do
        NotaDestacada.should_receive(:new).with({}).and_return(@nota_destacada)
        do_post
      end

      it "should redirect to the new nota_destacada" do
        do_post
        response.should redirect_to(nota_destacada_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @nota_destacada.should_receive(:save).and_return(false)
        post :create, :nota_destacada => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /nota_destacadas/1" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada, :to_param => "1")
      NotaDestacada.stub!(:find).and_return(@nota_destacada)
    end
    
    describe "with successful update" do

      def do_put
        @nota_destacada.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the nota_destacada requested" do
        NotaDestacada.should_receive(:find).with("1").and_return(@nota_destacada)
        do_put
      end

      it "should update the found nota_destacada" do
        do_put
        assigns(:nota_destacada).should equal(@nota_destacada)
      end

      it "should assign the found nota_destacada for the view" do
        do_put
        assigns(:nota_destacada).should equal(@nota_destacada)
      end

      it "should redirect to the nota_destacada" do
        do_put
        response.should redirect_to(nota_destacada_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @nota_destacada.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /nota_destacadas/1" do

    before(:each) do
      @nota_destacada = mock_model(NotaDestacada, :destroy => true)
      NotaDestacada.stub!(:find).and_return(@nota_destacada)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the nota_destacada requested" do
      NotaDestacada.should_receive(:find).with("1").and_return(@nota_destacada)
      do_delete
    end
  
    it "should call destroy on the found nota_destacada" do
      @nota_destacada.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the nota_destacadas list" do
      do_delete
      response.should redirect_to(nota_destacadas_url)
    end
  end
end