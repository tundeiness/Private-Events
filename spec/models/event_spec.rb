require 'rails_helper'

RSpec.describe Event, type: :model do


    context 'Validation tests' do

      let(:event) { build(:event) }

      it 'ensures title is provided' do
        event.title = nil
        expect(event.save).to eq(false)
      end

      it 'checks title with over 30 characters' do
        event.title = 'Antidisestermentarialism...really really long title'
        expect(event.save).to eq(false)
      end

      it 'checks title with less than 4 characters' do
        event.title = 'xte'
        expect(event.save).to eq(false)
      end

      it 'ensures description is provided' do
        event.title = 'The groove'
        event.description = nil
        expect(event.save).to eq(false)
      end

      it 'checks description with over 400 characters' do
        event.title = 'The groove'
        event.description = 'a' * 401
        expect(event.save).to eq(false)
      end

      it 'ensures date is provided' do
        event.title = 'The groove'
        event.description = 'An open house party'
        event.date = nil
        expect(event.save).to eq(false)
      end

      it 'ensures location is supplied' do
        event.title = 'The groove'
        event.description = 'An open house party'
        event.date = DateTime.now
        event.location = nil
        expect(event.save).to eq(false)
      end

      it 'ensures all fields are present with valid attributes and saves successfully' do
        event.title = 'A day to remember'
        event.description = 'The developer purge'
        event.date = DateTime.now
        event.location = 'San francisco'
        #event.creator = :event_creator
        expect(event.save).to eq(true)
      end

    end

    describe 'Associations' do
      it { should belong_to(:creator) }
    end
end
