require 'spec_helper'

describe "adjustments/edit" do
  before(:each) do
    @adjustment = assign(:adjustment, stub_model(Adjustment))
  end

  it "renders the edit adjustment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", adjustment_path(@adjustment), "post" do
    end
  end
end
