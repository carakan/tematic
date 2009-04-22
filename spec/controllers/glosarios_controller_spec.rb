require File.dirname(__FILE__) + '/../spec_helper'

describe GlosariosController do
  describe "handling GET /glosarios" do

    before(:each) do
      @glosario = mock_model(Glosario)
      Glosario.stub!(:find).and_return([@glosario])
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
  
    it "should find all glosarios" do
      Glosario.should_receive(:find).with(:all).and_return([@glosario])
      do_get
    end
  
    it "should assign the found glosarios for the view" do
      do_get
      assigns[:glosarios].should == [@glosario]
    end
  end

  describe "handling GET /glosarios.xml" do

    before(:each) do
      @glosario = mock_model(Glosario, :to_xml => "XML")
      Glosario.stub!(:find).and_return(@glosario)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all glosarios" do
      Glosario.should_receive(:find).with(:all).and_return([@glosario])
      do_get
    end
  
    it "should render the found glosarios as xml" do
      @glosario.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /glosarios/1" do

    before(:each) do
      @glosario = mock_model(Glosario)
      Glosario.stub!(:find).and_return(@glosario)
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
  
    it "should find the glosario requested" do
      Glosario.should_receive(:find).with("1").and_return(@glosario)
      do_get
    end
  
    it "should assign the found glosario for the view" do
      do_get
      assigns[:glosario].should equal(@glosario)
    end
  end

  describe "handling GET /glosarios/1.xml" do

    before(:each) do
      @glosario = mock_model(Glosario, :to_xml => "XML")
      Glosario.stub!(:find).and_return(@glosario)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the glosario requested" do
      Glosario.should_receive(:find).with("1").and_return(@glosario)
      do_get
    end
  
    it "should render the found glosario as xml" do
      @glosario.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /glosarios/new" do

    before(:each) do
      @glosario = mock_model(Glosario)
      Glosario.stub!(:new).and_return(@glosario)
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
  
    it "should create an new glosario" do
      Glosario.should_receive(:new).and_return(@glosario)
      do_get
    end
  
    it "should not save the new glosario" do
      @glosario.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new glosario for the view" do
      do_get
      assigns[:glosario].should equal(@glosario)
    end
  end

  describe "handling GET /glosarios/1/edit" do

    before(:each) do
      @glosario = mock_model(Glosario)
      Glosario.stub!(:find).and_return(@glosario)
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
  
    it "should find the glosario requested" do
      Glosario.should_receive(:find).and_return(@glosario)
      do_get
    end
  
    it "should assign the found Glosario for the view" do
      do_get
      assigns[:glosario].should equal(@glosario)
    end
  end

  describe "handling POST /glosarios" do

    before(:each) do
      @glosario = mock_model(Glosario, :to_param => "1")
      Glosario.stub!(:new).and_return(@glosario)
    end
    
    describe "with successful save" do
  
      def do_post
        @glosario.should_receive(:save).and_return(true)
        post :create, :glosario => {}
      end
  
      it "should create a new glosario" do
        Glosario.should_receive(:new).with({}).and_return(@glosario)
        do_post
      end

      it "should redirect to the new glosario" do
        do_post
        response.should redirect_to(glosario_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @glosario.should_receive(:save).and_return(false)
        post :create, :glosario => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /glosarios/1" do

    before(:each) do
      @glosario = mock_model(Glosario, :to_param => "1")
      Glosario.stub!(:find).and_return(@glosario)
    end
    
    describe "with successful update" do

      def do_put
        @glosario.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the glosario requested" do
        Glosario.should_receive(:find).with("1").and_return(@glosario)
        do_put
      end

      it "should update the found glosario" do
        do_put
        assigns(:glosario).should equal(@glosario)
      end

      it "should assign the found glosario for the view" do
        do_put
        assigns(:glosario).should equal(@glosario)
      end

      it "should redirect to the glosario" do
        do_put
        response.should redirect_to(glosario_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @glosario.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /glosarios/1" do

    before(:each) do
      @glosario = mock_model(Glosario, :destroy => true)
      Glosario.stub!(:find).and_return(@glosario)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the glosario requested" do
      Glosario.should_receive(:find).with("1").and_return(@glosario)
      do_delete
    end
  
    it "should call destroy on the found glosario" do
      @glosario.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the glosarios list" do
      do_delete
      response.should redirect_to(glosarios_url)
    end
  end
end