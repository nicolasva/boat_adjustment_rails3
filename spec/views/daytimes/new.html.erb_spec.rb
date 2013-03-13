require 'spec_helper'

describe "daytimes/new" do
  before(:each) do
    assign(:daytime, stub_model(Daytime).as_new_record)
  end

  it "renders new daytime form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", daytimes_path, "post" do
    end
  end
end
