require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  feature 'User signs up' do
    scenario 'with name, password and password confirmation only' do
      @mock_user = User.create(
        name: 'mark Greyhound',
        email: 'mg@example.com',
        password: 'foobaz',
        password_confirmation: 'foobaz'
      )
      visit signup_path
      sleep(2)
      fill_in 'Name', with: @mock_user.name
      fill_in 'Email', with: ' '
      fill_in 'Password', with: @mock_user.password
      fill_in 'Confirmation', with: @mock_user.password_confirmation
      click_button('Sign up')

      expect(page).to have_css '.alert-danger'
    end

    scenario 'with email, password and password confirmation only' do
      @mock_user = User.create(
        name: 'mark Greyhound',
        email: 'mg@example.com',
        password: 'foobaz',
        password_confirmation: 'foobaz'
      )
      visit signup_path
      sleep(2)
      fill_in 'Name', with: ' '
      fill_in 'Email', with: @mock_user.email
      fill_in 'Password', with: @mock_user.password
      fill_in 'Confirmation', with: @mock_user.password_confirmation
      click_button('Sign up')

      expect(page).to have_css '.alert-danger'
    end

    scenario 'with name, email, and password' do
      @mock_user = User.create(
        name: 'mark Greyhound',
        email: 'mg@example.com',
        password: 'foobaz',
        password_confirmation: 'foobaz'
      )
      visit signup_path
      sleep(2)
      fill_in 'Name', with: @mock_user.email
      fill_in 'Email', with: @mock_user.email
      fill_in 'Password', with: @mock_user.password
      fill_in 'Confirmation', with: ' '
      click_button('Sign up')

      expect(page).to have_css '.alert-danger'
    end

    scenario 'with name, email, password, and password confirmation' do
      @mock_user = User.create(
        name: 'mark Greyhound',
        email: 'mg@example.com',
        password: 'foobaz',
        password_confirmation: 'foobaz'
      )
      visit signup_path
      sleep(2)
      fill_in 'Name', with: @mock_user.email
      fill_in 'Email', with: @mock_user.email
      fill_in 'Password', with: @mock_user.password
      fill_in 'Confirmation', with: @mock_user.password_confirmation
      click_button('Sign up')

      expect(page).to have_css '.alert-success'
    end
  end
end
