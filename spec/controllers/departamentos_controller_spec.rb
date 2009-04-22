require File.dirname(__FILE__) + '/../spec_helper'

describe DepartamentosController do
  describe "handling GET /departamentos" do

    before(:each) do
      @departamento = mock_model(Departamento)
      Departamento.stub!(:find).and_return([@departamento])
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
  
    it "should find all departamentos" do
      Departamento.should_receive(:find).with(:all).and_return([@departamento])
      do_get
    end
  
    it "should assign the found departamentos for the view" do
      do_get
      assigns[:departamentos].should == [@departamento]
    end
  end

  describe "handling GET /departamentos.xml" do

    before(:each) do
      @departamento = mock_model(Departamento, :to_xml => "XML")
      Departamento.stub!(:find).and_return(@departamento)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all departamentos" do
      Departamento.should_receive(:find).with(:all).and_return([@departamento])
      do_get
    end
  
    it "should render the found departamentos as xml" do
      @departamento.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /departamentos/1" do

    before(:each) do
      @departamento = mock_model(Departamento)
      Departamento.stub!(:find).and_return(@departamento)
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
  
    it "should find the departamento requested" do
      Departamento.should_receive(:find).with("1").and_return(@departamento)
      do_get
    end
  
    it "should assign the found departamento for the view" do
      do_get
      assigns[:departamento].should equal(@departamento)
    end
  end

  describe "handling GET /departamentos/1.xml" do

    before(:each) do
      @departamento = mock_model(Departamento, :to_xml => "XML")
      Departamento.stub!(:find).and_return(@departamento)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the departamento requested" do
      Departamento.should_receive(:find).with("1").and_return(@departamento)
      do_get
    end
  
    it "should render the found departamento as xml" do
      @departamento.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /departamentos/new" do

    before(:each) do
      @departamento = mock_model(Departamento)
      Departamento.stub!(:new).and_return(@departamento)
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
  
    it "should create an new departamento" do
      Departamento.should_receive(:new).and_return(@departamento)
      do_get
    end
  
    it "should not save the new departamento" do
      @departamento.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new departamento for the view" do
      do_get
      assigns[:departamento].should equal(@departamento)
    end
  end

  describe "handling GET /departamentos/1/edit" do

    before(:each) do
      @departamento = mock_model(Departamento)
      Departamento.stub!(:find).and_return(@departamento)
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
  
    it "should find the departamento requested" do
      Departamento.should_receive(:find).and_return(@departamento)
      do_get
    end
  
    it "should assign the found Departamento for the view" do
      do_get
      assigns[:departamento].should equal(@departamento)
    end
  end

  describe "handling POST /departamentos" do

    before(:each) do
      @departamento = mock_model(Departamento, :to_param => "1")
      Departamento.stub!(:new).and_return(@departamento)
    end
    
    describe "with successful save" do
  
      def do_post
        @departamento.should_receive(:save).and_return(true)
        post :create, :departamento => {}
      end
  
      it "should create a new departamento" do
        Departamento.should_receive(:new).with({}).and_return(@departamento)
        do_post
      end

      it "should redirect to the new departamento" do
        do_post
        response.should redirect_to(departamento_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @departamento.should_receive(:save).and_return(false)
        post :create, :departamento => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /departamentos/1" do

    before(:each) do
      @departamento = mock_model(Departamento, :to_param => "1")
      Departamento.stub!(:find).and_return(@departamento)
    end
    
    describe "with successful update" do

      def do_put
        @departamento.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the departamento requested" do
        Departamento.should_receive(:find).with("1").and_return(@departamento)
        do_put
      end

      it "should update the found departamento" do
        do_put
        assigns(:departamento).should equal(@departamento)
      end

      it "should assign the found departamento for the view" do
        do_put
        assigns(:departamento).should equal(@departamento)
      end

      it "should redirect to the departamento" do
        do_put
        response.should redirect_to(departamento_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @departamento.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /departamentos/1" do

    before(:each) do
      @departamento = mock_model(Departamento, :destroy => true)
      Departamento.stub!(:find).and_return(@departamento)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the departamento requested" do
      Departamento.should_receive(:find).with("1").and_return(@departamento)
      do_delete
    end
  
    it "should call destroy on the found departamento" do
      @departamento.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the departamentos list" do
      do_delete
      response.should redirect_to(departamentos_url)
    end
  end
end