require 'rails_helper'
require 'capybara/rspec'

RSpec.feature User, type: :feature do
  scenario 'can login with registered email' do
    mock_user = User.create(name:'test',
                  email: 'test@gmail.com',
                  password: '123456789')
    #let(:name) { FactoryGirl.create(name: name) }
    #let(:email) { FactoryGirl.create(email: email) }
    #let(:password) { FactoryGirl.create(password: password) }
    visit signin_path
    #fill_in('Email', with: mock_user.email)
    #fill_in('email', with: 'test@gmail.com')

    #fill_in :password, with: '123456789'
    find('#session_email').set('test@gmail.com')
    find('#session_password').set('123456789')
    click_button('Sign in')
    #expect(page).to redirect_to(new_path(@user))
    #expect(page).to have_current_path(user_path(@user))
    #page.find("#session_email").click
   # page.find("#session_password").click
     mock_user.reload
     #expect(page).to have_content('Welcome')
     expect(page).to have_css '.user_info'
    #expect(mock_user.email).to eq(mock_user.email)
    #expect(mock_user.password).to eq(mock_user.password)
  end
end
