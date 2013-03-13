require "spec_helper"

describe AdjustmentTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/adjustment_types").should route_to("adjustment_types#index")
    end

    it "routes to #new" do
      get("/adjustment_types/new").should route_to("adjustment_types#new")
    end

    it "routes to #show" do
      get("/adjustment_types/1").should route_to("adjustment_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/adjustment_types/1/edit").should route_to("adjustment_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/adjustment_types").should route_to("adjustment_types#create")
    end

    it "routes to #update" do
      put("/adjustment_types/1").should route_to("adjustment_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/adjustment_types/1").should route_to("adjustment_types#destroy", :id => "1")
    end

  end
end
