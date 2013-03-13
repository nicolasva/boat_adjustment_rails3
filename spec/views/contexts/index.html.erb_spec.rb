require 'spec_helper'

describe "contexts/index" do
  before(:each) do
    assign(:contexts, [
      stub_model(Context),
      stub_model(Context)
    ])
  end

  it "renders a list of contexts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
