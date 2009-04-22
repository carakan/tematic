require File.dirname(__FILE__) + '/../spec_helper'

describe InstitucionsController do
  describe "handling GET /institucions" do

    before(:each) do
      @institucion = mock_model(Institucion)
      Institucion.stub!(:find).and_return([@institucion])
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
  
    it "should find all institucions" do
      Institucion.should_receive(:find).with(:all).and_return([@institucion])
      do_get
    end
  
    it "should assign the found institucions for the view" do
      do_get
      assigns[:institucions].should == [@institucion]
    end
  end

  describe "handling GET /institucions.xml" do

    before(:each) do
      @institucion = mock_model(Institucion, :to_xml => "XML")
      Institucion.stub!(:find).and_return(@institucion)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all institucions" do
      Institucion.should_receive(:find).with(:all).and_return([@institucion])
      do_get
    end
  
    it "should render the found institucions as xml" do
      @institucion.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /institucions/1" do

    before(:each) do
      @institucion = mock_model(Institucion)
      Institucion.stub!(:find).and_return(@institucion)
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
  
    it "should find the institucion requested" do
      Institucion.should_receive(:find).with("1").and_return(@institucion)
      do_get
    end
  
    it "should assign the found institucion for the view" do
      do_get
      assigns[:institucion].should equal(@institucion)
    end
  end

  describe "handling GET /institucions/1.xml" do

    before(:each) do
      @institucion = mock_model(Institucion, :to_xml => "XML")
      Institucion.stub!(:find).and_return(@institucion)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the institucion requested" do
      Institucion.should_receive(:find).with("1").and_return(@institucion)
      do_get
    end
  
    it "should render the found institucion as xml" do
      @institucion.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /institucions/new" do

    before(:each) do
      @institucion = mock_model(Institucion)
      Institucion.stub!(:new).and_return(@institucion)
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
  
    it "should create an new institucion" do
      Institucion.should_receive(:new).and_return(@institucion)
      do_get
    end
  
    it "should not save the new institucion" do
      @institucion.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new institucion for the view" do
      do_get
      assigns[:institucion].should equal(@institucion)
    end
  end

  describe "handling GET /institucions/1/edit" do

    before(:each) do
      @institucion = mock_model(Institucion)
      Institucion.stub!(:find).and_return(@institucion)
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
  
    it "should find the institucion requested" do
      Institucion.should_receive(:find).and_return(@institucion)
      do_get
    end
  
    it "should assign the found Institucion for the view" do
      do_get
      assigns[:institucion].should equal(@institucion)
    end
  end

  describe "handling POST /institucions" do

    before(:each) do
      @institucion = mock_model(Institucion, :to_param => "1")
      Institucion.stub!(:new).and_return(@institucion)
    end
    
    describe "with successful save" do
  
      def do_post
        @institucion.should_receive(:save).and_return(true)
        post :create, :institucion => {}
      end
  
      it "should create a new institucion" do
        Institucion.should_receive(:new).with({}).and_return(@institucion)
        do_post
      end

      it "should redirect to the new institucion" do
        do_post
        response.should redirect_to(institucion_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @institucion.should_receive(:save).and_return(false)
        post :create, :institucion => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /institucions/1" do

    before(:each) do
      @institucion = mock_model(Institucion, :to_param => "1")
      Institucion.stub!(:find).and_return(@institucion)
    end
    
    describe "with successful update" do

      def do_put
        @institucion.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the institucion requested" do
        Institucion.should_receive(:find).with("1").and_return(@institucion)
        do_put
      end

      it "should update the found institucion" do
        do_put
        assigns(:institucion).should equal(@institucion)
      end

      it "should assign the found institucion for the view" do
        do_put
        assigns(:institucion).should equal(@institucion)
      end

      it "should redirect to the institucion" do
        do_put
        response.should redirect_to(institucion_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @institucion.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /institucions/1" do

    before(:each) do
      @institucion = mock_model(Institucion, :destroy => true)
      Institucion.stub!(:find).and_return(@institucion)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the institucion requested" do
      Institucion.should_receive(:find).with("1").and_return(@institucion)
      do_delete
    end
  
    it "should call destroy on the found institucion" do
      @institucion.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the institucions list" do
      do_delete
      response.should redirect_to(institucions_url)
    end
  end
end