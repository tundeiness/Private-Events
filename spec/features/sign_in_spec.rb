require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'SignIns', type: :feature do
<<<<<<< HEAD

=======
>>>>>>> 0d36ce64fa941d89f6dc182548d194166f04275a
  feature 'User signs in' do
    scenario 'with registered email' do
      @mock_user = User.create(name: 'Michael Hartl',
                               email: 'mhartl@example.com',
                               password: 'foobar')
      visit signin_path
      fill_in 'Email', with: @mock_user.email
      fill_in 'Password', with: @mock_user.password
      click_button('Sign in')

      expect(page).to have_css '.user_info'
    end
<<<<<<< HEAD

    scenario 'with an unregistered email' do
      visit signin_path
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: '123456789'
      click_button('Sign in')

      expect(page).to have_content 'Invalid email/password combination'
    end

    scenario 'with a valid user and without a password' do
      visit signin_path
      fill_in 'Email', with: 'mhartl@example.com'
      fill_in 'Password', with: ' '
      click_button('Sign in')

      expect(page).to have_content 'Invalid email/password combination'
    end

    scenario 'without a user and without a password' do
      visit signin_path
      fill_in 'Email', with: ' '
      fill_in 'Password', with: ' '
      click_button('Sign in')

      expect(page).to have_content 'Invalid email/password combination'
    end
=======
>>>>>>> 0d36ce64fa941d89f6dc182548d194166f04275a
  end
end
