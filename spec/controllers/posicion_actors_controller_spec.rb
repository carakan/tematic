require File.dirname(__FILE__) + '/../spec_helper'

describe PosicionActorsController do
  describe "handling GET /posicion_actors" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor)
      PosicionActor.stub!(:find).and_return([@posicion_actor])
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
  
    it "should find all posicion_actors" do
      PosicionActor.should_receive(:find).with(:all).and_return([@posicion_actor])
      do_get
    end
  
    it "should assign the found posicion_actors for the view" do
      do_get
      assigns[:posicion_actors].should == [@posicion_actor]
    end
  end

  describe "handling GET /posicion_actors.xml" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor, :to_xml => "XML")
      PosicionActor.stub!(:find).and_return(@posicion_actor)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all posicion_actors" do
      PosicionActor.should_receive(:find).with(:all).and_return([@posicion_actor])
      do_get
    end
  
    it "should render the found posicion_actors as xml" do
      @posicion_actor.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /posicion_actors/1" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor)
      PosicionActor.stub!(:find).and_return(@posicion_actor)
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
  
    it "should find the posicion_actor requested" do
      PosicionActor.should_receive(:find).with("1").and_return(@posicion_actor)
      do_get
    end
  
    it "should assign the found posicion_actor for the view" do
      do_get
      assigns[:posicion_actor].should equal(@posicion_actor)
    end
  end

  describe "handling GET /posicion_actors/1.xml" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor, :to_xml => "XML")
      PosicionActor.stub!(:find).and_return(@posicion_actor)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the posicion_actor requested" do
      PosicionActor.should_receive(:find).with("1").and_return(@posicion_actor)
      do_get
    end
  
    it "should render the found posicion_actor as xml" do
      @posicion_actor.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /posicion_actors/new" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor)
      PosicionActor.stub!(:new).and_return(@posicion_actor)
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
  
    it "should create an new posicion_actor" do
      PosicionActor.should_receive(:new).and_return(@posicion_actor)
      do_get
    end
  
    it "should not save the new posicion_actor" do
      @posicion_actor.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new posicion_actor for the view" do
      do_get
      assigns[:posicion_actor].should equal(@posicion_actor)
    end
  end

  describe "handling GET /posicion_actors/1/edit" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor)
      PosicionActor.stub!(:find).and_return(@posicion_actor)
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
  
    it "should find the posicion_actor requested" do
      PosicionActor.should_receive(:find).and_return(@posicion_actor)
      do_get
    end
  
    it "should assign the found PosicionActor for the view" do
      do_get
      assigns[:posicion_actor].should equal(@posicion_actor)
    end
  end

  describe "handling POST /posicion_actors" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor, :to_param => "1")
      PosicionActor.stub!(:new).and_return(@posicion_actor)
    end
    
    describe "with successful save" do
  
      def do_post
        @posicion_actor.should_receive(:save).and_return(true)
        post :create, :posicion_actor => {}
      end
  
      it "should create a new posicion_actor" do
        PosicionActor.should_receive(:new).with({}).and_return(@posicion_actor)
        do_post
      end

      it "should redirect to the new posicion_actor" do
        do_post
        response.should redirect_to(posicion_actor_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @posicion_actor.should_receive(:save).and_return(false)
        post :create, :posicion_actor => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /posicion_actors/1" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor, :to_param => "1")
      PosicionActor.stub!(:find).and_return(@posicion_actor)
    end
    
    describe "with successful update" do

      def do_put
        @posicion_actor.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the posicion_actor requested" do
        PosicionActor.should_receive(:find).with("1").and_return(@posicion_actor)
        do_put
      end

      it "should update the found posicion_actor" do
        do_put
        assigns(:posicion_actor).should equal(@posicion_actor)
      end

      it "should assign the found posicion_actor for the view" do
        do_put
        assigns(:posicion_actor).should equal(@posicion_actor)
      end

      it "should redirect to the posicion_actor" do
        do_put
        response.should redirect_to(posicion_actor_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @posicion_actor.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /posicion_actors/1" do

    before(:each) do
      @posicion_actor = mock_model(PosicionActor, :destroy => true)
      PosicionActor.stub!(:find).and_return(@posicion_actor)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the posicion_actor requested" do
      PosicionActor.should_receive(:find).with("1").and_return(@posicion_actor)
      do_delete
    end
  
    it "should call destroy on the found posicion_actor" do
      @posicion_actor.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the posicion_actors list" do
      do_delete
      response.should redirect_to(posicion_actors_url)
    end
  end
end