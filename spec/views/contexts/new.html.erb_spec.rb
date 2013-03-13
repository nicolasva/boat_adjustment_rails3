require 'spec_helper'

describe "contexts/new" do
  before(:each) do
    assign(:context, stub_model(Context).as_new_record)
  end

  it "renders new context form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contexts_path, "post" do
    end
  end
end
