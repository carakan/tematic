require File.dirname(__FILE__) + '/../spec_helper'

describe PartidoPoliticosController do
  describe "handling GET /partido_politicos" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico)
      PartidoPolitico.stub!(:find).and_return([@partido_politico])
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
  
    it "should find all partido_politicos" do
      PartidoPolitico.should_receive(:find).with(:all).and_return([@partido_politico])
      do_get
    end
  
    it "should assign the found partido_politicos for the view" do
      do_get
      assigns[:partido_politicos].should == [@partido_politico]
    end
  end

  describe "handling GET /partido_politicos.xml" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico, :to_xml => "XML")
      PartidoPolitico.stub!(:find).and_return(@partido_politico)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all partido_politicos" do
      PartidoPolitico.should_receive(:find).with(:all).and_return([@partido_politico])
      do_get
    end
  
    it "should render the found partido_politicos as xml" do
      @partido_politico.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /partido_politicos/1" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico)
      PartidoPolitico.stub!(:find).and_return(@partido_politico)
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
  
    it "should find the partido_politico requested" do
      PartidoPolitico.should_receive(:find).with("1").and_return(@partido_politico)
      do_get
    end
  
    it "should assign the found partido_politico for the view" do
      do_get
      assigns[:partido_politico].should equal(@partido_politico)
    end
  end

  describe "handling GET /partido_politicos/1.xml" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico, :to_xml => "XML")
      PartidoPolitico.stub!(:find).and_return(@partido_politico)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the partido_politico requested" do
      PartidoPolitico.should_receive(:find).with("1").and_return(@partido_politico)
      do_get
    end
  
    it "should render the found partido_politico as xml" do
      @partido_politico.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /partido_politicos/new" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico)
      PartidoPolitico.stub!(:new).and_return(@partido_politico)
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
  
    it "should create an new partido_politico" do
      PartidoPolitico.should_receive(:new).and_return(@partido_politico)
      do_get
    end
  
    it "should not save the new partido_politico" do
      @partido_politico.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new partido_politico for the view" do
      do_get
      assigns[:partido_politico].should equal(@partido_politico)
    end
  end

  describe "handling GET /partido_politicos/1/edit" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico)
      PartidoPolitico.stub!(:find).and_return(@partido_politico)
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
  
    it "should find the partido_politico requested" do
      PartidoPolitico.should_receive(:find).and_return(@partido_politico)
      do_get
    end
  
    it "should assign the found PartidoPolitico for the view" do
      do_get
      assigns[:partido_politico].should equal(@partido_politico)
    end
  end

  describe "handling POST /partido_politicos" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico, :to_param => "1")
      PartidoPolitico.stub!(:new).and_return(@partido_politico)
    end
    
    describe "with successful save" do
  
      def do_post
        @partido_politico.should_receive(:save).and_return(true)
        post :create, :partido_politico => {}
      end
  
      it "should create a new partido_politico" do
        PartidoPolitico.should_receive(:new).with({}).and_return(@partido_politico)
        do_post
      end

      it "should redirect to the new partido_politico" do
        do_post
        response.should redirect_to(partido_politico_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @partido_politico.should_receive(:save).and_return(false)
        post :create, :partido_politico => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /partido_politicos/1" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico, :to_param => "1")
      PartidoPolitico.stub!(:find).and_return(@partido_politico)
    end
    
    describe "with successful update" do

      def do_put
        @partido_politico.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the partido_politico requested" do
        PartidoPolitico.should_receive(:find).with("1").and_return(@partido_politico)
        do_put
      end

      it "should update the found partido_politico" do
        do_put
        assigns(:partido_politico).should equal(@partido_politico)
      end

      it "should assign the found partido_politico for the view" do
        do_put
        assigns(:partido_politico).should equal(@partido_politico)
      end

      it "should redirect to the partido_politico" do
        do_put
        response.should redirect_to(partido_politico_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @partido_politico.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /partido_politicos/1" do

    before(:each) do
      @partido_politico = mock_model(PartidoPolitico, :destroy => true)
      PartidoPolitico.stub!(:find).and_return(@partido_politico)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the partido_politico requested" do
      PartidoPolitico.should_receive(:find).with("1").and_return(@partido_politico)
      do_delete
    end
  
    it "should call destroy on the found partido_politico" do
      @partido_politico.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the partido_politicos list" do
      do_delete
      response.should redirect_to(partido_politicos_url)
    end
  end
end