require File.dirname(__FILE__) + '/../spec_helper'

describe FichaTematicasController do
  describe "handling GET /ficha_tematicas" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica)
      FichaTematica.stub!(:find).and_return([@ficha_tematica])
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
  
    it "should find all ficha_tematicas" do
      FichaTematica.should_receive(:find).with(:all).and_return([@ficha_tematica])
      do_get
    end
  
    it "should assign the found ficha_tematicas for the view" do
      do_get
      assigns[:ficha_tematicas].should == [@ficha_tematica]
    end
  end

  describe "handling GET /ficha_tematicas.xml" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica, :to_xml => "XML")
      FichaTematica.stub!(:find).and_return(@ficha_tematica)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all ficha_tematicas" do
      FichaTematica.should_receive(:find).with(:all).and_return([@ficha_tematica])
      do_get
    end
  
    it "should render the found ficha_tematicas as xml" do
      @ficha_tematica.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /ficha_tematicas/1" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica)
      FichaTematica.stub!(:find).and_return(@ficha_tematica)
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
  
    it "should find the ficha_tematica requested" do
      FichaTematica.should_receive(:find).with("1").and_return(@ficha_tematica)
      do_get
    end
  
    it "should assign the found ficha_tematica for the view" do
      do_get
      assigns[:ficha_tematica].should equal(@ficha_tematica)
    end
  end

  describe "handling GET /ficha_tematicas/1.xml" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica, :to_xml => "XML")
      FichaTematica.stub!(:find).and_return(@ficha_tematica)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the ficha_tematica requested" do
      FichaTematica.should_receive(:find).with("1").and_return(@ficha_tematica)
      do_get
    end
  
    it "should render the found ficha_tematica as xml" do
      @ficha_tematica.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /ficha_tematicas/new" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica)
      FichaTematica.stub!(:new).and_return(@ficha_tematica)
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
  
    it "should create an new ficha_tematica" do
      FichaTematica.should_receive(:new).and_return(@ficha_tematica)
      do_get
    end
  
    it "should not save the new ficha_tematica" do
      @ficha_tematica.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new ficha_tematica for the view" do
      do_get
      assigns[:ficha_tematica].should equal(@ficha_tematica)
    end
  end

  describe "handling GET /ficha_tematicas/1/edit" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica)
      FichaTematica.stub!(:find).and_return(@ficha_tematica)
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
  
    it "should find the ficha_tematica requested" do
      FichaTematica.should_receive(:find).and_return(@ficha_tematica)
      do_get
    end
  
    it "should assign the found FichaTematica for the view" do
      do_get
      assigns[:ficha_tematica].should equal(@ficha_tematica)
    end
  end

  describe "handling POST /ficha_tematicas" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica, :to_param => "1")
      FichaTematica.stub!(:new).and_return(@ficha_tematica)
    end
    
    describe "with successful save" do
  
      def do_post
        @ficha_tematica.should_receive(:save).and_return(true)
        post :create, :ficha_tematica => {}
      end
  
      it "should create a new ficha_tematica" do
        FichaTematica.should_receive(:new).with({}).and_return(@ficha_tematica)
        do_post
      end

      it "should redirect to the new ficha_tematica" do
        do_post
        response.should redirect_to(ficha_tematica_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @ficha_tematica.should_receive(:save).and_return(false)
        post :create, :ficha_tematica => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /ficha_tematicas/1" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica, :to_param => "1")
      FichaTematica.stub!(:find).and_return(@ficha_tematica)
    end
    
    describe "with successful update" do

      def do_put
        @ficha_tematica.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the ficha_tematica requested" do
        FichaTematica.should_receive(:find).with("1").and_return(@ficha_tematica)
        do_put
      end

      it "should update the found ficha_tematica" do
        do_put
        assigns(:ficha_tematica).should equal(@ficha_tematica)
      end

      it "should assign the found ficha_tematica for the view" do
        do_put
        assigns(:ficha_tematica).should equal(@ficha_tematica)
      end

      it "should redirect to the ficha_tematica" do
        do_put
        response.should redirect_to(ficha_tematica_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @ficha_tematica.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /ficha_tematicas/1" do

    before(:each) do
      @ficha_tematica = mock_model(FichaTematica, :destroy => true)
      FichaTematica.stub!(:find).and_return(@ficha_tematica)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the ficha_tematica requested" do
      FichaTematica.should_receive(:find).with("1").and_return(@ficha_tematica)
      do_delete
    end
  
    it "should call destroy on the found ficha_tematica" do
      @ficha_tematica.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the ficha_tematicas list" do
      do_delete
      response.should redirect_to(ficha_tematicas_url)
    end
  end
end