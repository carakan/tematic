require File.dirname(__FILE__) + '/../spec_helper'

describe ValorNoticiasController do
  describe "handling GET /valor_noticias" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia)
      ValorNoticia.stub!(:find).and_return([@valor_noticia])
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
  
    it "should find all valor_noticias" do
      ValorNoticia.should_receive(:find).with(:all).and_return([@valor_noticia])
      do_get
    end
  
    it "should assign the found valor_noticias for the view" do
      do_get
      assigns[:valor_noticias].should == [@valor_noticia]
    end
  end

  describe "handling GET /valor_noticias.xml" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia, :to_xml => "XML")
      ValorNoticia.stub!(:find).and_return(@valor_noticia)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all valor_noticias" do
      ValorNoticia.should_receive(:find).with(:all).and_return([@valor_noticia])
      do_get
    end
  
    it "should render the found valor_noticias as xml" do
      @valor_noticia.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /valor_noticias/1" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia)
      ValorNoticia.stub!(:find).and_return(@valor_noticia)
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
  
    it "should find the valor_noticia requested" do
      ValorNoticia.should_receive(:find).with("1").and_return(@valor_noticia)
      do_get
    end
  
    it "should assign the found valor_noticia for the view" do
      do_get
      assigns[:valor_noticia].should equal(@valor_noticia)
    end
  end

  describe "handling GET /valor_noticias/1.xml" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia, :to_xml => "XML")
      ValorNoticia.stub!(:find).and_return(@valor_noticia)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the valor_noticia requested" do
      ValorNoticia.should_receive(:find).with("1").and_return(@valor_noticia)
      do_get
    end
  
    it "should render the found valor_noticia as xml" do
      @valor_noticia.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /valor_noticias/new" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia)
      ValorNoticia.stub!(:new).and_return(@valor_noticia)
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
  
    it "should create an new valor_noticia" do
      ValorNoticia.should_receive(:new).and_return(@valor_noticia)
      do_get
    end
  
    it "should not save the new valor_noticia" do
      @valor_noticia.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new valor_noticia for the view" do
      do_get
      assigns[:valor_noticia].should equal(@valor_noticia)
    end
  end

  describe "handling GET /valor_noticias/1/edit" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia)
      ValorNoticia.stub!(:find).and_return(@valor_noticia)
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
  
    it "should find the valor_noticia requested" do
      ValorNoticia.should_receive(:find).and_return(@valor_noticia)
      do_get
    end
  
    it "should assign the found ValorNoticia for the view" do
      do_get
      assigns[:valor_noticia].should equal(@valor_noticia)
    end
  end

  describe "handling POST /valor_noticias" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia, :to_param => "1")
      ValorNoticia.stub!(:new).and_return(@valor_noticia)
    end
    
    describe "with successful save" do
  
      def do_post
        @valor_noticia.should_receive(:save).and_return(true)
        post :create, :valor_noticia => {}
      end
  
      it "should create a new valor_noticia" do
        ValorNoticia.should_receive(:new).with({}).and_return(@valor_noticia)
        do_post
      end

      it "should redirect to the new valor_noticia" do
        do_post
        response.should redirect_to(valor_noticia_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @valor_noticia.should_receive(:save).and_return(false)
        post :create, :valor_noticia => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /valor_noticias/1" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia, :to_param => "1")
      ValorNoticia.stub!(:find).and_return(@valor_noticia)
    end
    
    describe "with successful update" do

      def do_put
        @valor_noticia.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the valor_noticia requested" do
        ValorNoticia.should_receive(:find).with("1").and_return(@valor_noticia)
        do_put
      end

      it "should update the found valor_noticia" do
        do_put
        assigns(:valor_noticia).should equal(@valor_noticia)
      end

      it "should assign the found valor_noticia for the view" do
        do_put
        assigns(:valor_noticia).should equal(@valor_noticia)
      end

      it "should redirect to the valor_noticia" do
        do_put
        response.should redirect_to(valor_noticia_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @valor_noticia.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /valor_noticias/1" do

    before(:each) do
      @valor_noticia = mock_model(ValorNoticia, :destroy => true)
      ValorNoticia.stub!(:find).and_return(@valor_noticia)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the valor_noticia requested" do
      ValorNoticia.should_receive(:find).with("1").and_return(@valor_noticia)
      do_delete
    end
  
    it "should call destroy on the found valor_noticia" do
      @valor_noticia.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the valor_noticias list" do
      do_delete
      response.should redirect_to(valor_noticias_url)
    end
  end
end