require_relative '../spec_helper'
RSpec.describe 'updating project' do
  it 'updates project and redirects to projects page' do
    project = Project.create(name: "Project 1", description: "First project")
    visit "/projects/#{project.id}/edit"
    expect(page.status_code).to eq(200)
    fill_in 'Name', with: "Changed"
    fill_in 'Description', with: "My changed project"
    click_button 'Update Project'
    expect(current_path).to eq("/projects")
    expect(page).not_to have_text("Project 1")
    expect(page).not_to have_text("First project")
    expect(page).to have_text("Changed")
    expect(page).to have_text("My changed project")
  end
end
