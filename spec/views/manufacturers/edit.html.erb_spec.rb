require 'spec_helper'

describe "manufacturers/edit" do
  before(:each) do
    @manufacturer = assign(:manufacturer, stub_model(Manufacturer))
  end

  it "renders the edit manufacturer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", manufacturer_path(@manufacturer), "post" do
    end
  end
end
