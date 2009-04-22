require File.dirname(__FILE__) + '/../spec_helper'

describe InstitucionPeriodisticasController do
  describe "handling GET /institucion_periodisticas" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica)
      InstitucionPeriodistica.stub!(:find).and_return([@institucion_periodistica])
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
  
    it "should find all institucion_periodisticas" do
      InstitucionPeriodistica.should_receive(:find).with(:all).and_return([@institucion_periodistica])
      do_get
    end
  
    it "should assign the found institucion_periodisticas for the view" do
      do_get
      assigns[:institucion_periodisticas].should == [@institucion_periodistica]
    end
  end

  describe "handling GET /institucion_periodisticas.xml" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica, :to_xml => "XML")
      InstitucionPeriodistica.stub!(:find).and_return(@institucion_periodistica)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all institucion_periodisticas" do
      InstitucionPeriodistica.should_receive(:find).with(:all).and_return([@institucion_periodistica])
      do_get
    end
  
    it "should render the found institucion_periodisticas as xml" do
      @institucion_periodistica.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /institucion_periodisticas/1" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica)
      InstitucionPeriodistica.stub!(:find).and_return(@institucion_periodistica)
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
  
    it "should find the institucion_periodistica requested" do
      InstitucionPeriodistica.should_receive(:find).with("1").and_return(@institucion_periodistica)
      do_get
    end
  
    it "should assign the found institucion_periodistica for the view" do
      do_get
      assigns[:institucion_periodistica].should equal(@institucion_periodistica)
    end
  end

  describe "handling GET /institucion_periodisticas/1.xml" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica, :to_xml => "XML")
      InstitucionPeriodistica.stub!(:find).and_return(@institucion_periodistica)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the institucion_periodistica requested" do
      InstitucionPeriodistica.should_receive(:find).with("1").and_return(@institucion_periodistica)
      do_get
    end
  
    it "should render the found institucion_periodistica as xml" do
      @institucion_periodistica.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /institucion_periodisticas/new" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica)
      InstitucionPeriodistica.stub!(:new).and_return(@institucion_periodistica)
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
  
    it "should create an new institucion_periodistica" do
      InstitucionPeriodistica.should_receive(:new).and_return(@institucion_periodistica)
      do_get
    end
  
    it "should not save the new institucion_periodistica" do
      @institucion_periodistica.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new institucion_periodistica for the view" do
      do_get
      assigns[:institucion_periodistica].should equal(@institucion_periodistica)
    end
  end

  describe "handling GET /institucion_periodisticas/1/edit" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica)
      InstitucionPeriodistica.stub!(:find).and_return(@institucion_periodistica)
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
  
    it "should find the institucion_periodistica requested" do
      InstitucionPeriodistica.should_receive(:find).and_return(@institucion_periodistica)
      do_get
    end
  
    it "should assign the found InstitucionPeriodistica for the view" do
      do_get
      assigns[:institucion_periodistica].should equal(@institucion_periodistica)
    end
  end

  describe "handling POST /institucion_periodisticas" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica, :to_param => "1")
      InstitucionPeriodistica.stub!(:new).and_return(@institucion_periodistica)
    end
    
    describe "with successful save" do
  
      def do_post
        @institucion_periodistica.should_receive(:save).and_return(true)
        post :create, :institucion_periodistica => {}
      end
  
      it "should create a new institucion_periodistica" do
        InstitucionPeriodistica.should_receive(:new).with({}).and_return(@institucion_periodistica)
        do_post
      end

      it "should redirect to the new institucion_periodistica" do
        do_post
        response.should redirect_to(institucion_periodistica_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @institucion_periodistica.should_receive(:save).and_return(false)
        post :create, :institucion_periodistica => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /institucion_periodisticas/1" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica, :to_param => "1")
      InstitucionPeriodistica.stub!(:find).and_return(@institucion_periodistica)
    end
    
    describe "with successful update" do

      def do_put
        @institucion_periodistica.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the institucion_periodistica requested" do
        InstitucionPeriodistica.should_receive(:find).with("1").and_return(@institucion_periodistica)
        do_put
      end

      it "should update the found institucion_periodistica" do
        do_put
        assigns(:institucion_periodistica).should equal(@institucion_periodistica)
      end

      it "should assign the found institucion_periodistica for the view" do
        do_put
        assigns(:institucion_periodistica).should equal(@institucion_periodistica)
      end

      it "should redirect to the institucion_periodistica" do
        do_put
        response.should redirect_to(institucion_periodistica_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @institucion_periodistica.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /institucion_periodisticas/1" do

    before(:each) do
      @institucion_periodistica = mock_model(InstitucionPeriodistica, :destroy => true)
      InstitucionPeriodistica.stub!(:find).and_return(@institucion_periodistica)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the institucion_periodistica requested" do
      InstitucionPeriodistica.should_receive(:find).with("1").and_return(@institucion_periodistica)
      do_delete
    end
  
    it "should call destroy on the found institucion_periodistica" do
      @institucion_periodistica.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the institucion_periodisticas list" do
      do_delete
      response.should redirect_to(institucion_periodisticas_url)
    end
  end
end