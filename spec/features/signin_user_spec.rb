require 'rails_helper'
require 'capybara/rspec'

RSpec.feature User, type: :feature do
  scenario 'Authentication User can login with registered name' do
    user11 = User.create(name:'test',
                  email: 'test@gmail.com',
                  password: '123456789')
    visit signin_path
    fill_in :name, with: "test"
    page.find("#session_name").click
    user11.reload
    expect(user11.email).to eq(user11.email)
  end
end