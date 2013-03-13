require 'spec_helper'

describe "adjustments/index" do
  before(:each) do
    assign(:adjustments, [
      stub_model(Adjustment),
      stub_model(Adjustment)
    ])
  end

  it "renders a list of adjustments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
