require 'spec_helper'

describe "manufacturers/index" do
  before(:each) do
    assign(:manufacturers, [
      stub_model(Manufacturer),
      stub_model(Manufacturer)
    ])
  end

  it "renders a list of manufacturers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
