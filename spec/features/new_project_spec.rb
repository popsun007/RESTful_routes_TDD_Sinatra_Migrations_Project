require_relative "../spec_helper"
RSpec.describe "new projec" do
  it "displays correct fields to create a new project" do
    visit "/projects/new"
    expect(page.status_code).to eq(200)
    expect(page).to have_field("Name")
    expect(page).to have_field("Description")
  end
end