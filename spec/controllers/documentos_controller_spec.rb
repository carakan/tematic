require File.dirname(__FILE__) + '/../spec_helper'

describe DocumentosController do
  describe "handling GET /documentos" do

    before(:each) do
      @documento = mock_model(Documento)
      Documento.stub!(:find).and_return([@documento])
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
  
    it "should find all documentos" do
      Documento.should_receive(:find).with(:all).and_return([@documento])
      do_get
    end
  
    it "should assign the found documentos for the view" do
      do_get
      assigns[:documentos].should == [@documento]
    end
  end

  describe "handling GET /documentos.xml" do

    before(:each) do
      @documento = mock_model(Documento, :to_xml => "XML")
      Documento.stub!(:find).and_return(@documento)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all documentos" do
      Documento.should_receive(:find).with(:all).and_return([@documento])
      do_get
    end
  
    it "should render the found documentos as xml" do
      @documento.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /documentos/1" do

    before(:each) do
      @documento = mock_model(Documento)
      Documento.stub!(:find).and_return(@documento)
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
  
    it "should find the documento requested" do
      Documento.should_receive(:find).with("1").and_return(@documento)
      do_get
    end
  
    it "should assign the found documento for the view" do
      do_get
      assigns[:documento].should equal(@documento)
    end
  end

  describe "handling GET /documentos/1.xml" do

    before(:each) do
      @documento = mock_model(Documento, :to_xml => "XML")
      Documento.stub!(:find).and_return(@documento)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the documento requested" do
      Documento.should_receive(:find).with("1").and_return(@documento)
      do_get
    end
  
    it "should render the found documento as xml" do
      @documento.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /documentos/new" do

    before(:each) do
      @documento = mock_model(Documento)
      Documento.stub!(:new).and_return(@documento)
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
  
    it "should create an new documento" do
      Documento.should_receive(:new).and_return(@documento)
      do_get
    end
  
    it "should not save the new documento" do
      @documento.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new documento for the view" do
      do_get
      assigns[:documento].should equal(@documento)
    end
  end

  describe "handling GET /documentos/1/edit" do

    before(:each) do
      @documento = mock_model(Documento)
      Documento.stub!(:find).and_return(@documento)
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
  
    it "should find the documento requested" do
      Documento.should_receive(:find).and_return(@documento)
      do_get
    end
  
    it "should assign the found Documento for the view" do
      do_get
      assigns[:documento].should equal(@documento)
    end
  end

  describe "handling POST /documentos" do

    before(:each) do
      @documento = mock_model(Documento, :to_param => "1")
      Documento.stub!(:new).and_return(@documento)
    end
    
    describe "with successful save" do
  
      def do_post
        @documento.should_receive(:save).and_return(true)
        post :create, :documento => {}
      end
  
      it "should create a new documento" do
        Documento.should_receive(:new).with({}).and_return(@documento)
        do_post
      end

      it "should redirect to the new documento" do
        do_post
        response.should redirect_to(documento_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @documento.should_receive(:save).and_return(false)
        post :create, :documento => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /documentos/1" do

    before(:each) do
      @documento = mock_model(Documento, :to_param => "1")
      Documento.stub!(:find).and_return(@documento)
    end
    
    describe "with successful update" do

      def do_put
        @documento.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the documento requested" do
        Documento.should_receive(:find).with("1").and_return(@documento)
        do_put
      end

      it "should update the found documento" do
        do_put
        assigns(:documento).should equal(@documento)
      end

      it "should assign the found documento for the view" do
        do_put
        assigns(:documento).should equal(@documento)
      end

      it "should redirect to the documento" do
        do_put
        response.should redirect_to(documento_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @documento.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /documentos/1" do

    before(:each) do
      @documento = mock_model(Documento, :destroy => true)
      Documento.stub!(:find).and_return(@documento)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the documento requested" do
      Documento.should_receive(:find).with("1").and_return(@documento)
      do_delete
    end
  
    it "should call destroy on the found documento" do
      @documento.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the documentos list" do
      do_delete
      response.should redirect_to(documentos_url)
    end
  end
end