require File.dirname(__FILE__) + '/../spec_helper'

describe SerieComparativasController do
  describe "handling GET /serie_comparativas" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa)
      SerieComparativa.stub!(:find).and_return([@serie_comparativa])
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
  
    it "should find all serie_comparativas" do
      SerieComparativa.should_receive(:find).with(:all).and_return([@serie_comparativa])
      do_get
    end
  
    it "should assign the found serie_comparativas for the view" do
      do_get
      assigns[:serie_comparativas].should == [@serie_comparativa]
    end
  end

  describe "handling GET /serie_comparativas.xml" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa, :to_xml => "XML")
      SerieComparativa.stub!(:find).and_return(@serie_comparativa)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all serie_comparativas" do
      SerieComparativa.should_receive(:find).with(:all).and_return([@serie_comparativa])
      do_get
    end
  
    it "should render the found serie_comparativas as xml" do
      @serie_comparativa.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /serie_comparativas/1" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa)
      SerieComparativa.stub!(:find).and_return(@serie_comparativa)
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
  
    it "should find the serie_comparativa requested" do
      SerieComparativa.should_receive(:find).with("1").and_return(@serie_comparativa)
      do_get
    end
  
    it "should assign the found serie_comparativa for the view" do
      do_get
      assigns[:serie_comparativa].should equal(@serie_comparativa)
    end
  end

  describe "handling GET /serie_comparativas/1.xml" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa, :to_xml => "XML")
      SerieComparativa.stub!(:find).and_return(@serie_comparativa)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the serie_comparativa requested" do
      SerieComparativa.should_receive(:find).with("1").and_return(@serie_comparativa)
      do_get
    end
  
    it "should render the found serie_comparativa as xml" do
      @serie_comparativa.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /serie_comparativas/new" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa)
      SerieComparativa.stub!(:new).and_return(@serie_comparativa)
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
  
    it "should create an new serie_comparativa" do
      SerieComparativa.should_receive(:new).and_return(@serie_comparativa)
      do_get
    end
  
    it "should not save the new serie_comparativa" do
      @serie_comparativa.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new serie_comparativa for the view" do
      do_get
      assigns[:serie_comparativa].should equal(@serie_comparativa)
    end
  end

  describe "handling GET /serie_comparativas/1/edit" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa)
      SerieComparativa.stub!(:find).and_return(@serie_comparativa)
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
  
    it "should find the serie_comparativa requested" do
      SerieComparativa.should_receive(:find).and_return(@serie_comparativa)
      do_get
    end
  
    it "should assign the found SerieComparativa for the view" do
      do_get
      assigns[:serie_comparativa].should equal(@serie_comparativa)
    end
  end

  describe "handling POST /serie_comparativas" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa, :to_param => "1")
      SerieComparativa.stub!(:new).and_return(@serie_comparativa)
    end
    
    describe "with successful save" do
  
      def do_post
        @serie_comparativa.should_receive(:save).and_return(true)
        post :create, :serie_comparativa => {}
      end
  
      it "should create a new serie_comparativa" do
        SerieComparativa.should_receive(:new).with({}).and_return(@serie_comparativa)
        do_post
      end

      it "should redirect to the new serie_comparativa" do
        do_post
        response.should redirect_to(serie_comparativa_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @serie_comparativa.should_receive(:save).and_return(false)
        post :create, :serie_comparativa => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /serie_comparativas/1" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa, :to_param => "1")
      SerieComparativa.stub!(:find).and_return(@serie_comparativa)
    end
    
    describe "with successful update" do

      def do_put
        @serie_comparativa.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the serie_comparativa requested" do
        SerieComparativa.should_receive(:find).with("1").and_return(@serie_comparativa)
        do_put
      end

      it "should update the found serie_comparativa" do
        do_put
        assigns(:serie_comparativa).should equal(@serie_comparativa)
      end

      it "should assign the found serie_comparativa for the view" do
        do_put
        assigns(:serie_comparativa).should equal(@serie_comparativa)
      end

      it "should redirect to the serie_comparativa" do
        do_put
        response.should redirect_to(serie_comparativa_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @serie_comparativa.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /serie_comparativas/1" do

    before(:each) do
      @serie_comparativa = mock_model(SerieComparativa, :destroy => true)
      SerieComparativa.stub!(:find).and_return(@serie_comparativa)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the serie_comparativa requested" do
      SerieComparativa.should_receive(:find).with("1").and_return(@serie_comparativa)
      do_delete
    end
  
    it "should call destroy on the found serie_comparativa" do
      @serie_comparativa.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the serie_comparativas list" do
      do_delete
      response.should redirect_to(serie_comparativas_url)
    end
  end
end