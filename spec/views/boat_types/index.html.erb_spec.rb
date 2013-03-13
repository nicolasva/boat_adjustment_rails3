require 'spec_helper'

describe "boat_types/index" do
  before(:each) do
    assign(:boat_types, [
      stub_model(BoatType),
      stub_model(BoatType)
    ])
  end

  it "renders a list of boat_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
