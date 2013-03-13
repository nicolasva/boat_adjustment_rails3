require 'spec_helper'

describe "daytimes/index" do
  before(:each) do
    assign(:daytimes, [
      stub_model(Daytime),
      stub_model(Daytime)
    ])
  end

  it "renders a list of daytimes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
