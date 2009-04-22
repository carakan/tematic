require File.dirname(__FILE__) + '/../spec_helper'

describe TipoInstitucionsController do
  describe "handling GET /tipo_institucions" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion)
      TipoInstitucion.stub!(:find).and_return([@tipo_institucion])
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
  
    it "should find all tipo_institucions" do
      TipoInstitucion.should_receive(:find).with(:all).and_return([@tipo_institucion])
      do_get
    end
  
    it "should assign the found tipo_institucions for the view" do
      do_get
      assigns[:tipo_institucions].should == [@tipo_institucion]
    end
  end

  describe "handling GET /tipo_institucions.xml" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion, :to_xml => "XML")
      TipoInstitucion.stub!(:find).and_return(@tipo_institucion)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all tipo_institucions" do
      TipoInstitucion.should_receive(:find).with(:all).and_return([@tipo_institucion])
      do_get
    end
  
    it "should render the found tipo_institucions as xml" do
      @tipo_institucion.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tipo_institucions/1" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion)
      TipoInstitucion.stub!(:find).and_return(@tipo_institucion)
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
  
    it "should find the tipo_institucion requested" do
      TipoInstitucion.should_receive(:find).with("1").and_return(@tipo_institucion)
      do_get
    end
  
    it "should assign the found tipo_institucion for the view" do
      do_get
      assigns[:tipo_institucion].should equal(@tipo_institucion)
    end
  end

  describe "handling GET /tipo_institucions/1.xml" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion, :to_xml => "XML")
      TipoInstitucion.stub!(:find).and_return(@tipo_institucion)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the tipo_institucion requested" do
      TipoInstitucion.should_receive(:find).with("1").and_return(@tipo_institucion)
      do_get
    end
  
    it "should render the found tipo_institucion as xml" do
      @tipo_institucion.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tipo_institucions/new" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion)
      TipoInstitucion.stub!(:new).and_return(@tipo_institucion)
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
  
    it "should create an new tipo_institucion" do
      TipoInstitucion.should_receive(:new).and_return(@tipo_institucion)
      do_get
    end
  
    it "should not save the new tipo_institucion" do
      @tipo_institucion.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new tipo_institucion for the view" do
      do_get
      assigns[:tipo_institucion].should equal(@tipo_institucion)
    end
  end

  describe "handling GET /tipo_institucions/1/edit" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion)
      TipoInstitucion.stub!(:find).and_return(@tipo_institucion)
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
  
    it "should find the tipo_institucion requested" do
      TipoInstitucion.should_receive(:find).and_return(@tipo_institucion)
      do_get
    end
  
    it "should assign the found TipoInstitucion for the view" do
      do_get
      assigns[:tipo_institucion].should equal(@tipo_institucion)
    end
  end

  describe "handling POST /tipo_institucions" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion, :to_param => "1")
      TipoInstitucion.stub!(:new).and_return(@tipo_institucion)
    end
    
    describe "with successful save" do
  
      def do_post
        @tipo_institucion.should_receive(:save).and_return(true)
        post :create, :tipo_institucion => {}
      end
  
      it "should create a new tipo_institucion" do
        TipoInstitucion.should_receive(:new).with({}).and_return(@tipo_institucion)
        do_post
      end

      it "should redirect to the new tipo_institucion" do
        do_post
        response.should redirect_to(tipo_institucion_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @tipo_institucion.should_receive(:save).and_return(false)
        post :create, :tipo_institucion => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /tipo_institucions/1" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion, :to_param => "1")
      TipoInstitucion.stub!(:find).and_return(@tipo_institucion)
    end
    
    describe "with successful update" do

      def do_put
        @tipo_institucion.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the tipo_institucion requested" do
        TipoInstitucion.should_receive(:find).with("1").and_return(@tipo_institucion)
        do_put
      end

      it "should update the found tipo_institucion" do
        do_put
        assigns(:tipo_institucion).should equal(@tipo_institucion)
      end

      it "should assign the found tipo_institucion for the view" do
        do_put
        assigns(:tipo_institucion).should equal(@tipo_institucion)
      end

      it "should redirect to the tipo_institucion" do
        do_put
        response.should redirect_to(tipo_institucion_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @tipo_institucion.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /tipo_institucions/1" do

    before(:each) do
      @tipo_institucion = mock_model(TipoInstitucion, :destroy => true)
      TipoInstitucion.stub!(:find).and_return(@tipo_institucion)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the tipo_institucion requested" do
      TipoInstitucion.should_receive(:find).with("1").and_return(@tipo_institucion)
      do_delete
    end
  
    it "should call destroy on the found tipo_institucion" do
      @tipo_institucion.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the tipo_institucions list" do
      do_delete
      response.should redirect_to(tipo_institucions_url)
    end
  end
end