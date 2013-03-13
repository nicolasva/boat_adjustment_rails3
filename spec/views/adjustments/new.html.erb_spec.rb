require 'spec_helper'

describe "adjustments/new" do
  before(:each) do
    assign(:adjustment, stub_model(Adjustment).as_new_record)
  end

  it "renders new adjustment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", adjustments_path, "post" do
    end
  end
end
