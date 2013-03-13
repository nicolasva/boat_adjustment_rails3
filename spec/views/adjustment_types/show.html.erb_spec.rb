require 'spec_helper'

describe "adjustment_types/show" do
  before(:each) do
    @adjustment_type = assign(:adjustment_type, stub_model(AdjustmentType))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
