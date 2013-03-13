require 'spec_helper'

describe "daytimes/edit" do
  before(:each) do
    @daytime = assign(:daytime, stub_model(Daytime))
  end

  it "renders the edit daytime form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", daytime_path(@daytime), "post" do
    end
  end
end
