require_relative '../spec_helper'
RSpec.describe 'destroying project' do
  it 'destroys project and redirects to projects page' do
    project1 = Project.create(name: "Project", description: "Project description")
    project2 = Project.create(name: "Reject", description: "Reject description")
    visit "/projects/#{project2.id}/edit"
    expect(page.status_code).to eq(200)
    click_button 'Delete Project'
    expect(current_path).to eq('/projects')
    expect(page).to have_text(project1.name)
    expect(page).to_not have_text(project2.name)
  end
end
