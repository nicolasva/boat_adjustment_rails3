require 'spec_helper'

describe "adjustment_types/edit" do
  before(:each) do
    @adjustment_type = assign(:adjustment_type, stub_model(AdjustmentType))
  end

  it "renders the edit adjustment_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", adjustment_type_path(@adjustment_type), "post" do
    end
  end
end
