require File.dirname(__FILE__) + '/../spec_helper'

describe ImagensController do
  describe "handling GET /imagens" do

    before(:each) do
      @imagen = mock_model(Imagen)
      Imagen.stub!(:find).and_return([@imagen])
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
  
    it "should find all imagens" do
      Imagen.should_receive(:find).with(:all).and_return([@imagen])
      do_get
    end
  
    it "should assign the found imagens for the view" do
      do_get
      assigns[:imagens].should == [@imagen]
    end
  end

  describe "handling GET /imagens.xml" do

    before(:each) do
      @imagen = mock_model(Imagen, :to_xml => "XML")
      Imagen.stub!(:find).and_return(@imagen)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all imagens" do
      Imagen.should_receive(:find).with(:all).and_return([@imagen])
      do_get
    end
  
    it "should render the found imagens as xml" do
      @imagen.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /imagens/1" do

    before(:each) do
      @imagen = mock_model(Imagen)
      Imagen.stub!(:find).and_return(@imagen)
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
  
    it "should find the imagen requested" do
      Imagen.should_receive(:find).with("1").and_return(@imagen)
      do_get
    end
  
    it "should assign the found imagen for the view" do
      do_get
      assigns[:imagen].should equal(@imagen)
    end
  end

  describe "handling GET /imagens/1.xml" do

    before(:each) do
      @imagen = mock_model(Imagen, :to_xml => "XML")
      Imagen.stub!(:find).and_return(@imagen)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the imagen requested" do
      Imagen.should_receive(:find).with("1").and_return(@imagen)
      do_get
    end
  
    it "should render the found imagen as xml" do
      @imagen.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /imagens/new" do

    before(:each) do
      @imagen = mock_model(Imagen)
      Imagen.stub!(:new).and_return(@imagen)
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
  
    it "should create an new imagen" do
      Imagen.should_receive(:new).and_return(@imagen)
      do_get
    end
  
    it "should not save the new imagen" do
      @imagen.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new imagen for the view" do
      do_get
      assigns[:imagen].should equal(@imagen)
    end
  end

  describe "handling GET /imagens/1/edit" do

    before(:each) do
      @imagen = mock_model(Imagen)
      Imagen.stub!(:find).and_return(@imagen)
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
  
    it "should find the imagen requested" do
      Imagen.should_receive(:find).and_return(@imagen)
      do_get
    end
  
    it "should assign the found Imagen for the view" do
      do_get
      assigns[:imagen].should equal(@imagen)
    end
  end

  describe "handling POST /imagens" do

    before(:each) do
      @imagen = mock_model(Imagen, :to_param => "1")
      Imagen.stub!(:new).and_return(@imagen)
    end
    
    describe "with successful save" do
  
      def do_post
        @imagen.should_receive(:save).and_return(true)
        post :create, :imagen => {}
      end
  
      it "should create a new imagen" do
        Imagen.should_receive(:new).with({}).and_return(@imagen)
        do_post
      end

      it "should redirect to the new imagen" do
        do_post
        response.should redirect_to(imagen_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @imagen.should_receive(:save).and_return(false)
        post :create, :imagen => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /imagens/1" do

    before(:each) do
      @imagen = mock_model(Imagen, :to_param => "1")
      Imagen.stub!(:find).and_return(@imagen)
    end
    
    describe "with successful update" do

      def do_put
        @imagen.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the imagen requested" do
        Imagen.should_receive(:find).with("1").and_return(@imagen)
        do_put
      end

      it "should update the found imagen" do
        do_put
        assigns(:imagen).should equal(@imagen)
      end

      it "should assign the found imagen for the view" do
        do_put
        assigns(:imagen).should equal(@imagen)
      end

      it "should redirect to the imagen" do
        do_put
        response.should redirect_to(imagen_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @imagen.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /imagens/1" do

    before(:each) do
      @imagen = mock_model(Imagen, :destroy => true)
      Imagen.stub!(:find).and_return(@imagen)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the imagen requested" do
      Imagen.should_receive(:find).with("1").and_return(@imagen)
      do_delete
    end
  
    it "should call destroy on the found imagen" do
      @imagen.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the imagens list" do
      do_delete
      response.should redirect_to(imagens_url)
    end
  end
end