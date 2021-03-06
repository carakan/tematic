require File.dirname(__FILE__) + '/../spec_helper'

describe ComentariosController do
  describe "handling GET /comentarios" do

    before(:each) do
      @comentario = mock_model(Comentario)
      Comentario.stub!(:find).and_return([@comentario])
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
  
    it "should find all comentarios" do
      Comentario.should_receive(:find).with(:all).and_return([@comentario])
      do_get
    end
  
    it "should assign the found comentarios for the view" do
      do_get
      assigns[:comentarios].should == [@comentario]
    end
  end

  describe "handling GET /comentarios.xml" do

    before(:each) do
      @comentario = mock_model(Comentario, :to_xml => "XML")
      Comentario.stub!(:find).and_return(@comentario)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all comentarios" do
      Comentario.should_receive(:find).with(:all).and_return([@comentario])
      do_get
    end
  
    it "should render the found comentarios as xml" do
      @comentario.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /comentarios/1" do

    before(:each) do
      @comentario = mock_model(Comentario)
      Comentario.stub!(:find).and_return(@comentario)
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
  
    it "should find the comentario requested" do
      Comentario.should_receive(:find).with("1").and_return(@comentario)
      do_get
    end
  
    it "should assign the found comentario for the view" do
      do_get
      assigns[:comentario].should equal(@comentario)
    end
  end

  describe "handling GET /comentarios/1.xml" do

    before(:each) do
      @comentario = mock_model(Comentario, :to_xml => "XML")
      Comentario.stub!(:find).and_return(@comentario)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the comentario requested" do
      Comentario.should_receive(:find).with("1").and_return(@comentario)
      do_get
    end
  
    it "should render the found comentario as xml" do
      @comentario.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /comentarios/new" do

    before(:each) do
      @comentario = mock_model(Comentario)
      Comentario.stub!(:new).and_return(@comentario)
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
  
    it "should create an new comentario" do
      Comentario.should_receive(:new).and_return(@comentario)
      do_get
    end
  
    it "should not save the new comentario" do
      @comentario.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new comentario for the view" do
      do_get
      assigns[:comentario].should equal(@comentario)
    end
  end

  describe "handling GET /comentarios/1/edit" do

    before(:each) do
      @comentario = mock_model(Comentario)
      Comentario.stub!(:find).and_return(@comentario)
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
  
    it "should find the comentario requested" do
      Comentario.should_receive(:find).and_return(@comentario)
      do_get
    end
  
    it "should assign the found Comentario for the view" do
      do_get
      assigns[:comentario].should equal(@comentario)
    end
  end

  describe "handling POST /comentarios" do

    before(:each) do
      @comentario = mock_model(Comentario, :to_param => "1")
      Comentario.stub!(:new).and_return(@comentario)
    end
    
    describe "with successful save" do
  
      def do_post
        @comentario.should_receive(:save).and_return(true)
        post :create, :comentario => {}
      end
  
      it "should create a new comentario" do
        Comentario.should_receive(:new).with({}).and_return(@comentario)
        do_post
      end

      it "should redirect to the new comentario" do
        do_post
        response.should redirect_to(comentario_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @comentario.should_receive(:save).and_return(false)
        post :create, :comentario => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /comentarios/1" do

    before(:each) do
      @comentario = mock_model(Comentario, :to_param => "1")
      Comentario.stub!(:find).and_return(@comentario)
    end
    
    describe "with successful update" do

      def do_put
        @comentario.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the comentario requested" do
        Comentario.should_receive(:find).with("1").and_return(@comentario)
        do_put
      end

      it "should update the found comentario" do
        do_put
        assigns(:comentario).should equal(@comentario)
      end

      it "should assign the found comentario for the view" do
        do_put
        assigns(:comentario).should equal(@comentario)
      end

      it "should redirect to the comentario" do
        do_put
        response.should redirect_to(comentario_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @comentario.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /comentarios/1" do

    before(:each) do
      @comentario = mock_model(Comentario, :destroy => true)
      Comentario.stub!(:find).and_return(@comentario)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the comentario requested" do
      Comentario.should_receive(:find).with("1").and_return(@comentario)
      do_delete
    end
  
    it "should call destroy on the found comentario" do
      @comentario.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the comentarios list" do
      do_delete
      response.should redirect_to(comentarios_url)
    end
  end
end