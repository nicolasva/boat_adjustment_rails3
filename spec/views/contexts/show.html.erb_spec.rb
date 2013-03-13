require 'spec_helper'

describe "contexts/show" do
  before(:each) do
    @context = assign(:context, stub_model(Context))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
