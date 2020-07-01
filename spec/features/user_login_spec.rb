require 'rails_helper'

RSpec.feature "Visitor logs in with a pre-registered account", type: :feature, js: true do
  
  before(:each) do
    User.create(
      first_name: "Tom", 
      last_name: "Jonson",
      email: "tjonson@fakemail.com",
      password: "example",
      password_confirmation: "example"
    )
  end

  scenario 'User is able to log in' do
    
    visit root_path

    find('a', text: "Login").click

    expect(page).to have_css 'section.login'

    fill_in 'Email', with: 'tjonson@fakemail.com'
    fill_in 'Password', with: 'example'

    find('#login-submit').click
    
    expect(page).to have_css 'a', text: 'Logout'

    save_screenshot('user_login.png')
 
  end
end
