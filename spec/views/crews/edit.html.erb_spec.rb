require 'spec_helper'

describe "crews/edit" do
  before(:each) do
    @crew = assign(:crew, stub_model(Crew))
  end

  it "renders the edit crew form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", crew_path(@crew), "post" do
    end
  end
end
