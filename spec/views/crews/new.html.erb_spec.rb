require 'spec_helper'

describe "crews/new" do
  before(:each) do
    assign(:crew, stub_model(Crew).as_new_record)
  end

  it "renders new crew form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", crews_path, "post" do
    end
  end
end
