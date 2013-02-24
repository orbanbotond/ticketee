require 'spec_helper'

feature 'Creating Projects' do
  before(:each) do
    sign_in_as!(Factory(:admin_user))
    visit '/'
    click_link 'New Project'
  end
  scenario "can create a project" do
    fill_in 'Name', :with => 'TextMate 2'
    fill_in 'Description', :with => "A text-editor for OS X"
    click_button 'Create Project'
    page.should have_content('Project has been created.')

    project = Project.find_by_name("TextMate 2")
    page.current_url.should == project_url(project)
    title = "TextMate 2 - Projects - Ticketee"
    find("title").should have_content(title)
  end
  scenario "can not create a project without a name" do
    click_button 'Create Project'
    page.should have_content("Project has not been created.")
    page.should have_content("Name can't be blank")
  end
end