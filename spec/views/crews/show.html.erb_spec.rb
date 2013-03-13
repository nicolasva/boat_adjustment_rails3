require 'spec_helper'

describe "crews/show" do
  before(:each) do
    @crew = assign(:crew, stub_model(Crew))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
