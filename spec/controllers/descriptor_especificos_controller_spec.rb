require File.dirname(__FILE__) + '/../spec_helper'

describe DescriptorEspecificosController do
  describe "handling GET /descriptor_especificos" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico)
      DescriptorEspecifico.stub!(:find).and_return([@descriptor_especifico])
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
  
    it "should find all descriptor_especificos" do
      DescriptorEspecifico.should_receive(:find).with(:all).and_return([@descriptor_especifico])
      do_get
    end
  
    it "should assign the found descriptor_especificos for the view" do
      do_get
      assigns[:descriptor_especificos].should == [@descriptor_especifico]
    end
  end

  describe "handling GET /descriptor_especificos.xml" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico, :to_xml => "XML")
      DescriptorEspecifico.stub!(:find).and_return(@descriptor_especifico)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all descriptor_especificos" do
      DescriptorEspecifico.should_receive(:find).with(:all).and_return([@descriptor_especifico])
      do_get
    end
  
    it "should render the found descriptor_especificos as xml" do
      @descriptor_especifico.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /descriptor_especificos/1" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico)
      DescriptorEspecifico.stub!(:find).and_return(@descriptor_especifico)
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
  
    it "should find the descriptor_especifico requested" do
      DescriptorEspecifico.should_receive(:find).with("1").and_return(@descriptor_especifico)
      do_get
    end
  
    it "should assign the found descriptor_especifico for the view" do
      do_get
      assigns[:descriptor_especifico].should equal(@descriptor_especifico)
    end
  end

  describe "handling GET /descriptor_especificos/1.xml" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico, :to_xml => "XML")
      DescriptorEspecifico.stub!(:find).and_return(@descriptor_especifico)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the descriptor_especifico requested" do
      DescriptorEspecifico.should_receive(:find).with("1").and_return(@descriptor_especifico)
      do_get
    end
  
    it "should render the found descriptor_especifico as xml" do
      @descriptor_especifico.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /descriptor_especificos/new" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico)
      DescriptorEspecifico.stub!(:new).and_return(@descriptor_especifico)
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
  
    it "should create an new descriptor_especifico" do
      DescriptorEspecifico.should_receive(:new).and_return(@descriptor_especifico)
      do_get
    end
  
    it "should not save the new descriptor_especifico" do
      @descriptor_especifico.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new descriptor_especifico for the view" do
      do_get
      assigns[:descriptor_especifico].should equal(@descriptor_especifico)
    end
  end

  describe "handling GET /descriptor_especificos/1/edit" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico)
      DescriptorEspecifico.stub!(:find).and_return(@descriptor_especifico)
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
  
    it "should find the descriptor_especifico requested" do
      DescriptorEspecifico.should_receive(:find).and_return(@descriptor_especifico)
      do_get
    end
  
    it "should assign the found DescriptorEspecifico for the view" do
      do_get
      assigns[:descriptor_especifico].should equal(@descriptor_especifico)
    end
  end

  describe "handling POST /descriptor_especificos" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico, :to_param => "1")
      DescriptorEspecifico.stub!(:new).and_return(@descriptor_especifico)
    end
    
    describe "with successful save" do
  
      def do_post
        @descriptor_especifico.should_receive(:save).and_return(true)
        post :create, :descriptor_especifico => {}
      end
  
      it "should create a new descriptor_especifico" do
        DescriptorEspecifico.should_receive(:new).with({}).and_return(@descriptor_especifico)
        do_post
      end

      it "should redirect to the new descriptor_especifico" do
        do_post
        response.should redirect_to(descriptor_especifico_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @descriptor_especifico.should_receive(:save).and_return(false)
        post :create, :descriptor_especifico => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /descriptor_especificos/1" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico, :to_param => "1")
      DescriptorEspecifico.stub!(:find).and_return(@descriptor_especifico)
    end
    
    describe "with successful update" do

      def do_put
        @descriptor_especifico.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the descriptor_especifico requested" do
        DescriptorEspecifico.should_receive(:find).with("1").and_return(@descriptor_especifico)
        do_put
      end

      it "should update the found descriptor_especifico" do
        do_put
        assigns(:descriptor_especifico).should equal(@descriptor_especifico)
      end

      it "should assign the found descriptor_especifico for the view" do
        do_put
        assigns(:descriptor_especifico).should equal(@descriptor_especifico)
      end

      it "should redirect to the descriptor_especifico" do
        do_put
        response.should redirect_to(descriptor_especifico_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @descriptor_especifico.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /descriptor_especificos/1" do

    before(:each) do
      @descriptor_especifico = mock_model(DescriptorEspecifico, :destroy => true)
      DescriptorEspecifico.stub!(:find).and_return(@descriptor_especifico)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the descriptor_especifico requested" do
      DescriptorEspecifico.should_receive(:find).with("1").and_return(@descriptor_especifico)
      do_delete
    end
  
    it "should call destroy on the found descriptor_especifico" do
      @descriptor_especifico.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the descriptor_especificos list" do
      do_delete
      response.should redirect_to(descriptor_especificos_url)
    end
  end
end