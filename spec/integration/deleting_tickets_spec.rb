require 'spec_helper'

feature 'Deleting tickets' do
  let!(:project) { Factory(:project) }
  let!(:user) { Factory(:confirmed_user)}
  let!(:ticket) do
    ticket = Factory(:ticket, :project => project) 
    ticket.update_attribute(:user, user)
    ticket
  end
  before do
    define_permission!(user, "view", project)
    define_permission!(user, "delete tickets", project)
    sign_in_as!(user)
    visit '/'
    click_link project.name
    click_link ticket.title
  end
  scenario "Deleting a ticket" do
    click_link "Delete Ticket"
    page.should have_content("Ticket has been deleted.")
    page.current_url.should == project_url(project)
  end
  scenario "New ticket link is shown to a user with permission" do
    define_permission!(user, "view", project)
    define_permission!(user, "create tickets", project)
    visit project_path(project)
    assert_link_for "New Ticket"
  end
  scenario "New ticket link is hidden from a user without permission" do
    define_permission!(user, "view", project)
    visit project_path(project)
    assert_no_link_for "New Ticket"
  end
  describe "admin"do
    let!(:user) { Factory(:admin_user)}
    scenario "New ticket link is shown to admins" do
      visit project_path(project)
      assert_link_for "New Ticket"
    end
  end
end