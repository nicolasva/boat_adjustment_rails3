require 'spec_helper'

describe "adjustments/show" do
  before(:each) do
    @adjustment = assign(:adjustment, stub_model(Adjustment))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
