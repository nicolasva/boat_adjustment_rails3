require 'spec_helper'

describe "contexts/edit" do
  before(:each) do
    @context = assign(:context, stub_model(Context))
  end

  it "renders the edit context form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", context_path(@context), "post" do
    end
  end
end
