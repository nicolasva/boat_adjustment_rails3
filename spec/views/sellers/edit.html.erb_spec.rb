require 'spec_helper'

describe "sellers/edit" do
  before(:each) do
    @seller = assign(:seller, stub_model(Seller))
  end

  it "renders the edit seller form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", seller_path(@seller), "post" do
    end
  end
end
