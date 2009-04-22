require File.dirname(__FILE__) + '/../spec_helper'

describe DescriptorGenericosController do
  describe "handling GET /descriptor_genericos" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico)
      DescriptorGenerico.stub!(:find).and_return([@descriptor_generico])
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
  
    it "should find all descriptor_genericos" do
      DescriptorGenerico.should_receive(:find).with(:all).and_return([@descriptor_generico])
      do_get
    end
  
    it "should assign the found descriptor_genericos for the view" do
      do_get
      assigns[:descriptor_genericos].should == [@descriptor_generico]
    end
  end

  describe "handling GET /descriptor_genericos.xml" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico, :to_xml => "XML")
      DescriptorGenerico.stub!(:find).and_return(@descriptor_generico)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all descriptor_genericos" do
      DescriptorGenerico.should_receive(:find).with(:all).and_return([@descriptor_generico])
      do_get
    end
  
    it "should render the found descriptor_genericos as xml" do
      @descriptor_generico.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /descriptor_genericos/1" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico)
      DescriptorGenerico.stub!(:find).and_return(@descriptor_generico)
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
  
    it "should find the descriptor_generico requested" do
      DescriptorGenerico.should_receive(:find).with("1").and_return(@descriptor_generico)
      do_get
    end
  
    it "should assign the found descriptor_generico for the view" do
      do_get
      assigns[:descriptor_generico].should equal(@descriptor_generico)
    end
  end

  describe "handling GET /descriptor_genericos/1.xml" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico, :to_xml => "XML")
      DescriptorGenerico.stub!(:find).and_return(@descriptor_generico)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the descriptor_generico requested" do
      DescriptorGenerico.should_receive(:find).with("1").and_return(@descriptor_generico)
      do_get
    end
  
    it "should render the found descriptor_generico as xml" do
      @descriptor_generico.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /descriptor_genericos/new" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico)
      DescriptorGenerico.stub!(:new).and_return(@descriptor_generico)
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
  
    it "should create an new descriptor_generico" do
      DescriptorGenerico.should_receive(:new).and_return(@descriptor_generico)
      do_get
    end
  
    it "should not save the new descriptor_generico" do
      @descriptor_generico.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new descriptor_generico for the view" do
      do_get
      assigns[:descriptor_generico].should equal(@descriptor_generico)
    end
  end

  describe "handling GET /descriptor_genericos/1/edit" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico)
      DescriptorGenerico.stub!(:find).and_return(@descriptor_generico)
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
  
    it "should find the descriptor_generico requested" do
      DescriptorGenerico.should_receive(:find).and_return(@descriptor_generico)
      do_get
    end
  
    it "should assign the found DescriptorGenerico for the view" do
      do_get
      assigns[:descriptor_generico].should equal(@descriptor_generico)
    end
  end

  describe "handling POST /descriptor_genericos" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico, :to_param => "1")
      DescriptorGenerico.stub!(:new).and_return(@descriptor_generico)
    end
    
    describe "with successful save" do
  
      def do_post
        @descriptor_generico.should_receive(:save).and_return(true)
        post :create, :descriptor_generico => {}
      end
  
      it "should create a new descriptor_generico" do
        DescriptorGenerico.should_receive(:new).with({}).and_return(@descriptor_generico)
        do_post
      end

      it "should redirect to the new descriptor_generico" do
        do_post
        response.should redirect_to(descriptor_generico_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @descriptor_generico.should_receive(:save).and_return(false)
        post :create, :descriptor_generico => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /descriptor_genericos/1" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico, :to_param => "1")
      DescriptorGenerico.stub!(:find).and_return(@descriptor_generico)
    end
    
    describe "with successful update" do

      def do_put
        @descriptor_generico.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the descriptor_generico requested" do
        DescriptorGenerico.should_receive(:find).with("1").and_return(@descriptor_generico)
        do_put
      end

      it "should update the found descriptor_generico" do
        do_put
        assigns(:descriptor_generico).should equal(@descriptor_generico)
      end

      it "should assign the found descriptor_generico for the view" do
        do_put
        assigns(:descriptor_generico).should equal(@descriptor_generico)
      end

      it "should redirect to the descriptor_generico" do
        do_put
        response.should redirect_to(descriptor_generico_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @descriptor_generico.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /descriptor_genericos/1" do

    before(:each) do
      @descriptor_generico = mock_model(DescriptorGenerico, :destroy => true)
      DescriptorGenerico.stub!(:find).and_return(@descriptor_generico)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the descriptor_generico requested" do
      DescriptorGenerico.should_receive(:find).with("1").and_return(@descriptor_generico)
      do_delete
    end
  
    it "should call destroy on the found descriptor_generico" do
      @descriptor_generico.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the descriptor_genericos list" do
      do_delete
      response.should redirect_to(descriptor_genericos_url)
    end
  end
end