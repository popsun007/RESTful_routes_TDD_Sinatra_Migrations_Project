require_relative "../spec_helper.rb"
RSpec.describe "project show page" do
  it "displays information about the project" do
    p = Project.create(name: "Project", description: "Project description")
    visit "/projects/#{p.id}"
    expect(page.status_code).to eq(200)
    expect(page).to have_text(p.name)
    expect(page).to have_text(p.description)
  end
end