require File.dirname(__FILE__) + '/../spec_helper'

describe LegislacionsController do
  describe "handling GET /legislacions" do

    before(:each) do
      @legislacion = mock_model(Legislacion)
      Legislacion.stub!(:find).and_return([@legislacion])
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
  
    it "should find all legislacions" do
      Legislacion.should_receive(:find).with(:all).and_return([@legislacion])
      do_get
    end
  
    it "should assign the found legislacions for the view" do
      do_get
      assigns[:legislacions].should == [@legislacion]
    end
  end

  describe "handling GET /legislacions.xml" do

    before(:each) do
      @legislacion = mock_model(Legislacion, :to_xml => "XML")
      Legislacion.stub!(:find).and_return(@legislacion)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all legislacions" do
      Legislacion.should_receive(:find).with(:all).and_return([@legislacion])
      do_get
    end
  
    it "should render the found legislacions as xml" do
      @legislacion.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /legislacions/1" do

    before(:each) do
      @legislacion = mock_model(Legislacion)
      Legislacion.stub!(:find).and_return(@legislacion)
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
  
    it "should find the legislacion requested" do
      Legislacion.should_receive(:find).with("1").and_return(@legislacion)
      do_get
    end
  
    it "should assign the found legislacion for the view" do
      do_get
      assigns[:legislacion].should equal(@legislacion)
    end
  end

  describe "handling GET /legislacions/1.xml" do

    before(:each) do
      @legislacion = mock_model(Legislacion, :to_xml => "XML")
      Legislacion.stub!(:find).and_return(@legislacion)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the legislacion requested" do
      Legislacion.should_receive(:find).with("1").and_return(@legislacion)
      do_get
    end
  
    it "should render the found legislacion as xml" do
      @legislacion.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /legislacions/new" do

    before(:each) do
      @legislacion = mock_model(Legislacion)
      Legislacion.stub!(:new).and_return(@legislacion)
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
  
    it "should create an new legislacion" do
      Legislacion.should_receive(:new).and_return(@legislacion)
      do_get
    end
  
    it "should not save the new legislacion" do
      @legislacion.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new legislacion for the view" do
      do_get
      assigns[:legislacion].should equal(@legislacion)
    end
  end

  describe "handling GET /legislacions/1/edit" do

    before(:each) do
      @legislacion = mock_model(Legislacion)
      Legislacion.stub!(:find).and_return(@legislacion)
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
  
    it "should find the legislacion requested" do
      Legislacion.should_receive(:find).and_return(@legislacion)
      do_get
    end
  
    it "should assign the found Legislacion for the view" do
      do_get
      assigns[:legislacion].should equal(@legislacion)
    end
  end

  describe "handling POST /legislacions" do

    before(:each) do
      @legislacion = mock_model(Legislacion, :to_param => "1")
      Legislacion.stub!(:new).and_return(@legislacion)
    end
    
    describe "with successful save" do
  
      def do_post
        @legislacion.should_receive(:save).and_return(true)
        post :create, :legislacion => {}
      end
  
      it "should create a new legislacion" do
        Legislacion.should_receive(:new).with({}).and_return(@legislacion)
        do_post
      end

      it "should redirect to the new legislacion" do
        do_post
        response.should redirect_to(legislacion_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @legislacion.should_receive(:save).and_return(false)
        post :create, :legislacion => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /legislacions/1" do

    before(:each) do
      @legislacion = mock_model(Legislacion, :to_param => "1")
      Legislacion.stub!(:find).and_return(@legislacion)
    end
    
    describe "with successful update" do

      def do_put
        @legislacion.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the legislacion requested" do
        Legislacion.should_receive(:find).with("1").and_return(@legislacion)
        do_put
      end

      it "should update the found legislacion" do
        do_put
        assigns(:legislacion).should equal(@legislacion)
      end

      it "should assign the found legislacion for the view" do
        do_put
        assigns(:legislacion).should equal(@legislacion)
      end

      it "should redirect to the legislacion" do
        do_put
        response.should redirect_to(legislacion_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @legislacion.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /legislacions/1" do

    before(:each) do
      @legislacion = mock_model(Legislacion, :destroy => true)
      Legislacion.stub!(:find).and_return(@legislacion)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the legislacion requested" do
      Legislacion.should_receive(:find).with("1").and_return(@legislacion)
      do_delete
    end
  
    it "should call destroy on the found legislacion" do
      @legislacion.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the legislacions list" do
      do_delete
      response.should redirect_to(legislacions_url)
    end
  end
end