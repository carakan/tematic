require File.dirname(__FILE__) + '/../spec_helper'

describe ActorsController do
  describe "handling GET /actors" do

    before(:each) do
      @actor = mock_model(Actor)
      Actor.stub!(:find).and_return([@actor])
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
  
    it "should find all actors" do
      Actor.should_receive(:find).with(:all).and_return([@actor])
      do_get
    end
  
    it "should assign the found actors for the view" do
      do_get
      assigns[:actors].should == [@actor]
    end
  end

  describe "handling GET /actors.xml" do

    before(:each) do
      @actor = mock_model(Actor, :to_xml => "XML")
      Actor.stub!(:find).and_return(@actor)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all actors" do
      Actor.should_receive(:find).with(:all).and_return([@actor])
      do_get
    end
  
    it "should render the found actors as xml" do
      @actor.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /actors/1" do

    before(:each) do
      @actor = mock_model(Actor)
      Actor.stub!(:find).and_return(@actor)
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
  
    it "should find the actor requested" do
      Actor.should_receive(:find).with("1").and_return(@actor)
      do_get
    end
  
    it "should assign the found actor for the view" do
      do_get
      assigns[:actor].should equal(@actor)
    end
  end

  describe "handling GET /actors/1.xml" do

    before(:each) do
      @actor = mock_model(Actor, :to_xml => "XML")
      Actor.stub!(:find).and_return(@actor)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the actor requested" do
      Actor.should_receive(:find).with("1").and_return(@actor)
      do_get
    end
  
    it "should render the found actor as xml" do
      @actor.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /actors/new" do

    before(:each) do
      @actor = mock_model(Actor)
      Actor.stub!(:new).and_return(@actor)
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
  
    it "should create an new actor" do
      Actor.should_receive(:new).and_return(@actor)
      do_get
    end
  
    it "should not save the new actor" do
      @actor.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new actor for the view" do
      do_get
      assigns[:actor].should equal(@actor)
    end
  end

  describe "handling GET /actors/1/edit" do

    before(:each) do
      @actor = mock_model(Actor)
      Actor.stub!(:find).and_return(@actor)
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
  
    it "should find the actor requested" do
      Actor.should_receive(:find).and_return(@actor)
      do_get
    end
  
    it "should assign the found Actor for the view" do
      do_get
      assigns[:actor].should equal(@actor)
    end
  end

  describe "handling POST /actors" do

    before(:each) do
      @actor = mock_model(Actor, :to_param => "1")
      Actor.stub!(:new).and_return(@actor)
    end
    
    describe "with successful save" do
  
      def do_post
        @actor.should_receive(:save).and_return(true)
        post :create, :actor => {}
      end
  
      it "should create a new actor" do
        Actor.should_receive(:new).with({}).and_return(@actor)
        do_post
      end

      it "should redirect to the new actor" do
        do_post
        response.should redirect_to(actor_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @actor.should_receive(:save).and_return(false)
        post :create, :actor => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /actors/1" do

    before(:each) do
      @actor = mock_model(Actor, :to_param => "1")
      Actor.stub!(:find).and_return(@actor)
    end
    
    describe "with successful update" do

      def do_put
        @actor.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the actor requested" do
        Actor.should_receive(:find).with("1").and_return(@actor)
        do_put
      end

      it "should update the found actor" do
        do_put
        assigns(:actor).should equal(@actor)
      end

      it "should assign the found actor for the view" do
        do_put
        assigns(:actor).should equal(@actor)
      end

      it "should redirect to the actor" do
        do_put
        response.should redirect_to(actor_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @actor.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /actors/1" do

    before(:each) do
      @actor = mock_model(Actor, :destroy => true)
      Actor.stub!(:find).and_return(@actor)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the actor requested" do
      Actor.should_receive(:find).with("1").and_return(@actor)
      do_delete
    end
  
    it "should call destroy on the found actor" do
      @actor.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the actors list" do
      do_delete
      response.should redirect_to(actors_url)
    end
  end
end