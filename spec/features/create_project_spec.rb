require_relative "../spec_helper"
RSpec.describe 'creating project' do
  it 'creates a new project and redirect to projects page' do
    visit '/projects/new'
    expect(page.status_code).to eq(200)
    fill_in 'Name', with: "Project 1"
    fill_in 'Description', with: "My first project"
    click_button 'Create Project'
    expect(current_path).to eq('/projects')
    expect(page).to have_text("Project 1")
  end
end