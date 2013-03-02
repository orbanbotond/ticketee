require 'spec_helper'

feature "Assigning permissions" do
  let!(:admin) { Factory(:admin_user) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:project) { Factory(:project) }
  let!(:ticket) { Factory(:ticket, :project => project, :user => user) }
  before do
    sign_in_as!(admin)
    click_link "Admin"
    click_link "Users"
    click_link user.email
    click_link "Permissions"
  end
  scenario "Viewing a project" do
    check_permission_box "view", project
    click_button "Update"
    click_link "Sign out"
    sign_in_as!(user)
    page.should have_content(project.name)
  end
  def check_permission_box(permission, object)
   check "permissions_#{object.id}_#{permission}"
  end
end