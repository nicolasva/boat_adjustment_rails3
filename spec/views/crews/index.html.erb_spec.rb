require 'spec_helper'

describe "crews/index" do
  before(:each) do
    assign(:crews, [
      stub_model(Crew),
      stub_model(Crew)
    ])
  end

  it "renders a list of crews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
