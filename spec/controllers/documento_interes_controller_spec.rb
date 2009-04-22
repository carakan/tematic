require File.dirname(__FILE__) + '/../spec_helper'

describe DocumentoInteresController do
  describe "handling GET /documento_interes" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere)
      DocumentoIntere.stub!(:find).and_return([@documento_intere])
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
  
    it "should find all documento_interes" do
      DocumentoIntere.should_receive(:find).with(:all).and_return([@documento_intere])
      do_get
    end
  
    it "should assign the found documento_interes for the view" do
      do_get
      assigns[:documento_interes].should == [@documento_intere]
    end
  end

  describe "handling GET /documento_interes.xml" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere, :to_xml => "XML")
      DocumentoIntere.stub!(:find).and_return(@documento_intere)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all documento_interes" do
      DocumentoIntere.should_receive(:find).with(:all).and_return([@documento_intere])
      do_get
    end
  
    it "should render the found documento_interes as xml" do
      @documento_intere.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /documento_interes/1" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere)
      DocumentoIntere.stub!(:find).and_return(@documento_intere)
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
  
    it "should find the documento_intere requested" do
      DocumentoIntere.should_receive(:find).with("1").and_return(@documento_intere)
      do_get
    end
  
    it "should assign the found documento_intere for the view" do
      do_get
      assigns[:documento_intere].should equal(@documento_intere)
    end
  end

  describe "handling GET /documento_interes/1.xml" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere, :to_xml => "XML")
      DocumentoIntere.stub!(:find).and_return(@documento_intere)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the documento_intere requested" do
      DocumentoIntere.should_receive(:find).with("1").and_return(@documento_intere)
      do_get
    end
  
    it "should render the found documento_intere as xml" do
      @documento_intere.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /documento_interes/new" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere)
      DocumentoIntere.stub!(:new).and_return(@documento_intere)
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
  
    it "should create an new documento_intere" do
      DocumentoIntere.should_receive(:new).and_return(@documento_intere)
      do_get
    end
  
    it "should not save the new documento_intere" do
      @documento_intere.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new documento_intere for the view" do
      do_get
      assigns[:documento_intere].should equal(@documento_intere)
    end
  end

  describe "handling GET /documento_interes/1/edit" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere)
      DocumentoIntere.stub!(:find).and_return(@documento_intere)
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
  
    it "should find the documento_intere requested" do
      DocumentoIntere.should_receive(:find).and_return(@documento_intere)
      do_get
    end
  
    it "should assign the found DocumentoIntere for the view" do
      do_get
      assigns[:documento_intere].should equal(@documento_intere)
    end
  end

  describe "handling POST /documento_interes" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere, :to_param => "1")
      DocumentoIntere.stub!(:new).and_return(@documento_intere)
    end
    
    describe "with successful save" do
  
      def do_post
        @documento_intere.should_receive(:save).and_return(true)
        post :create, :documento_intere => {}
      end
  
      it "should create a new documento_intere" do
        DocumentoIntere.should_receive(:new).with({}).and_return(@documento_intere)
        do_post
      end

      it "should redirect to the new documento_intere" do
        do_post
        response.should redirect_to(documento_intere_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @documento_intere.should_receive(:save).and_return(false)
        post :create, :documento_intere => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /documento_interes/1" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere, :to_param => "1")
      DocumentoIntere.stub!(:find).and_return(@documento_intere)
    end
    
    describe "with successful update" do

      def do_put
        @documento_intere.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the documento_intere requested" do
        DocumentoIntere.should_receive(:find).with("1").and_return(@documento_intere)
        do_put
      end

      it "should update the found documento_intere" do
        do_put
        assigns(:documento_intere).should equal(@documento_intere)
      end

      it "should assign the found documento_intere for the view" do
        do_put
        assigns(:documento_intere).should equal(@documento_intere)
      end

      it "should redirect to the documento_intere" do
        do_put
        response.should redirect_to(documento_intere_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @documento_intere.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /documento_interes/1" do

    before(:each) do
      @documento_intere = mock_model(DocumentoIntere, :destroy => true)
      DocumentoIntere.stub!(:find).and_return(@documento_intere)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the documento_intere requested" do
      DocumentoIntere.should_receive(:find).with("1").and_return(@documento_intere)
      do_delete
    end
  
    it "should call destroy on the found documento_intere" do
      @documento_intere.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the documento_interes list" do
      do_delete
      response.should redirect_to(documento_interes_url)
    end
  end
end