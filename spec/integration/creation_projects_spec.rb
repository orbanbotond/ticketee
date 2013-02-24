require 'spec_helper'

feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'
    click_link 'New Project'
    fill_in 'Name', :with => 'TextMate 2'
    fill_in 'Description', :with => "A text-editor for OS X"
    click_button 'Create Project'
    page.should have_content('Project has been created.')

    project = Project.find_by_name("TextMate 2")
    page.current_url.should == project_url(project)
    title = "TextMate 2 - Projects - Ticketee"
    find("title").should have_content(title)
  end
end