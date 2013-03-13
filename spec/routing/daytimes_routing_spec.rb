require "spec_helper"

describe DaytimesController do
  describe "routing" do

    it "routes to #index" do
      get("/daytimes").should route_to("daytimes#index")
    end

    it "routes to #new" do
      get("/daytimes/new").should route_to("daytimes#new")
    end

    it "routes to #show" do
      get("/daytimes/1").should route_to("daytimes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/daytimes/1/edit").should route_to("daytimes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/daytimes").should route_to("daytimes#create")
    end

    it "routes to #update" do
      put("/daytimes/1").should route_to("daytimes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/daytimes/1").should route_to("daytimes#destroy", :id => "1")
    end

  end
end
