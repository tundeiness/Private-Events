require 'rails_helper'

RSpec.describe 'events managments', type: :feature do
  scenario 'events have Past events index' do
    visit events_path
    sleep(2)
    expect(page).to have_content('Past Events')
  end

  scenario 'events have Future events index' do
    visit events_path
    sleep(2)
    expect(page).to have_content('Future Events')
  end
end
