require 'spec_helper'

describe "sellers/show" do
  before(:each) do
    @seller = assign(:seller, stub_model(Seller))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
