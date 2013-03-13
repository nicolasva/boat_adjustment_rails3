require 'spec_helper'

describe "adjustment_types/index" do
  before(:each) do
    assign(:adjustment_types, [
      stub_model(AdjustmentType),
      stub_model(AdjustmentType)
    ])
  end

  it "renders a list of adjustment_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
