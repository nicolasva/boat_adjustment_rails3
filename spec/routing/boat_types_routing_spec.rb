require "spec_helper"

describe BoatTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/boat_types").should route_to("boat_types#index")
    end

    it "routes to #new" do
      get("/boat_types/new").should route_to("boat_types#new")
    end

    it "routes to #show" do
      get("/boat_types/1").should route_to("boat_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/boat_types/1/edit").should route_to("boat_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/boat_types").should route_to("boat_types#create")
    end

    it "routes to #update" do
      put("/boat_types/1").should route_to("boat_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/boat_types/1").should route_to("boat_types#destroy", :id => "1")
    end

  end
end
