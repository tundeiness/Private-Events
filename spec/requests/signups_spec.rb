require 'rails_helper'

RSpec.describe "Signup", type: :request do
  describe "GET /signup" do
    it "shows successful routing to signup page" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /signup" do
    it "displays successful signup" do
      User.create!(name: 'Test', email: 'Test@example.com', password: 'foobar', password_confirmation: 'foobar')
      visit signup_path
      #expect(response).to have_http_status(200)
      #response.body.should include('Test','Test@example.com', 'foobar',
      #'foobar')
      expect(page).to have_css '.alert-success'
    end
  end

end
