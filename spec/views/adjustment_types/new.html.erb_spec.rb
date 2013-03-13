require 'spec_helper'

describe "adjustment_types/new" do
  before(:each) do
    assign(:adjustment_type, stub_model(AdjustmentType).as_new_record)
  end

  it "renders new adjustment_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", adjustment_types_path, "post" do
    end
  end
end
