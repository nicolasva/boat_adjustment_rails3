require 'spec_helper'

describe "sellers/index" do
  before(:each) do
    assign(:sellers, [
      stub_model(Seller),
      stub_model(Seller)
    ])
  end

  it "renders a list of sellers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
