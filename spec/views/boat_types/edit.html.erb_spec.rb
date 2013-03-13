require 'spec_helper'

describe "boat_types/edit" do
  before(:each) do
    @boat_type = assign(:boat_type, stub_model(BoatType))
  end

  it "renders the edit boat_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", boat_type_path(@boat_type), "post" do
    end
  end
end
