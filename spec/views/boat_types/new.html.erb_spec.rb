require 'spec_helper'

describe "boat_types/new" do
  before(:each) do
    assign(:boat_type, stub_model(BoatType).as_new_record)
  end

  it "renders new boat_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", boat_types_path, "post" do
    end
  end
end
