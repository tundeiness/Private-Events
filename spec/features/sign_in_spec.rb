require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'SignIns', type: :feature do
  feature 'User signs in' do
    scenario 'with registered email' do
      @mock_user = User.create(name:'test',
        name: 'Michael Hartl',
        email: 'mhartl@example.com',
        password: 'foobar')
      visit signin_path
      fill_in 'Email', with: @mock_user.email
      fill_in 'Password', with: @mock_user.password
      click_button('Sign in')

      expect(page).to have_css '.user_info'
      expect(page).to have_content `Welcome" #{@mock_user.name}`
    end
  end
end
