require File.dirname(__FILE__) + '/../spec_helper'

describe CalendariosController do
  describe "handling GET /calendarios" do

    before(:each) do
      @calendario = mock_model(Calendario)
      Calendario.stub!(:find).and_return([@calendario])
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
  
    it "should find all calendarios" do
      Calendario.should_receive(:find).with(:all).and_return([@calendario])
      do_get
    end
  
    it "should assign the found calendarios for the view" do
      do_get
      assigns[:calendarios].should == [@calendario]
    end
  end

  describe "handling GET /calendarios.xml" do

    before(:each) do
      @calendario = mock_model(Calendario, :to_xml => "XML")
      Calendario.stub!(:find).and_return(@calendario)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all calendarios" do
      Calendario.should_receive(:find).with(:all).and_return([@calendario])
      do_get
    end
  
    it "should render the found calendarios as xml" do
      @calendario.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /calendarios/1" do

    before(:each) do
      @calendario = mock_model(Calendario)
      Calendario.stub!(:find).and_return(@calendario)
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
  
    it "should find the calendario requested" do
      Calendario.should_receive(:find).with("1").and_return(@calendario)
      do_get
    end
  
    it "should assign the found calendario for the view" do
      do_get
      assigns[:calendario].should equal(@calendario)
    end
  end

  describe "handling GET /calendarios/1.xml" do

    before(:each) do
      @calendario = mock_model(Calendario, :to_xml => "XML")
      Calendario.stub!(:find).and_return(@calendario)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the calendario requested" do
      Calendario.should_receive(:find).with("1").and_return(@calendario)
      do_get
    end
  
    it "should render the found calendario as xml" do
      @calendario.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /calendarios/new" do

    before(:each) do
      @calendario = mock_model(Calendario)
      Calendario.stub!(:new).and_return(@calendario)
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
  
    it "should create an new calendario" do
      Calendario.should_receive(:new).and_return(@calendario)
      do_get
    end
  
    it "should not save the new calendario" do
      @calendario.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new calendario for the view" do
      do_get
      assigns[:calendario].should equal(@calendario)
    end
  end

  describe "handling GET /calendarios/1/edit" do

    before(:each) do
      @calendario = mock_model(Calendario)
      Calendario.stub!(:find).and_return(@calendario)
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
  
    it "should find the calendario requested" do
      Calendario.should_receive(:find).and_return(@calendario)
      do_get
    end
  
    it "should assign the found Calendario for the view" do
      do_get
      assigns[:calendario].should equal(@calendario)
    end
  end

  describe "handling POST /calendarios" do

    before(:each) do
      @calendario = mock_model(Calendario, :to_param => "1")
      Calendario.stub!(:new).and_return(@calendario)
    end
    
    describe "with successful save" do
  
      def do_post
        @calendario.should_receive(:save).and_return(true)
        post :create, :calendario => {}
      end
  
      it "should create a new calendario" do
        Calendario.should_receive(:new).with({}).and_return(@calendario)
        do_post
      end

      it "should redirect to the new calendario" do
        do_post
        response.should redirect_to(calendario_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @calendario.should_receive(:save).and_return(false)
        post :create, :calendario => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /calendarios/1" do

    before(:each) do
      @calendario = mock_model(Calendario, :to_param => "1")
      Calendario.stub!(:find).and_return(@calendario)
    end
    
    describe "with successful update" do

      def do_put
        @calendario.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the calendario requested" do
        Calendario.should_receive(:find).with("1").and_return(@calendario)
        do_put
      end

      it "should update the found calendario" do
        do_put
        assigns(:calendario).should equal(@calendario)
      end

      it "should assign the found calendario for the view" do
        do_put
        assigns(:calendario).should equal(@calendario)
      end

      it "should redirect to the calendario" do
        do_put
        response.should redirect_to(calendario_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @calendario.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /calendarios/1" do

    before(:each) do
      @calendario = mock_model(Calendario, :destroy => true)
      Calendario.stub!(:find).and_return(@calendario)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the calendario requested" do
      Calendario.should_receive(:find).with("1").and_return(@calendario)
      do_delete
    end
  
    it "should call destroy on the found calendario" do
      @calendario.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the calendarios list" do
      do_delete
      response.should redirect_to(calendarios_url)
    end
  end
end