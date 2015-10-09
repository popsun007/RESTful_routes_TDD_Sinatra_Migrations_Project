require_relative '../spec_helper'
RSpec.describe 'listing projects' do
  it 'displays list of existing projects' do
    p = Project.create(name: "Project 1", description: "First project")
    p2 = Project.create(name: "Project 2", description: "Second project")
    visit '/projects'
    expect(page.status_code).to eq(200)
    expect(page).to have_text(p.name)
    expect(page).to have_text(p2.name)
  end
end