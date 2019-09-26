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
        expect(event.save).to eq(true)
      end

    end

    context 'Association tests' do
      describe 'model associations' do
        it 'belongs to creator' do
          assc = Event.reflect_on_association(:creator)
          expect(assc.macro).to eq :belongs_to
        end

        it 'has many attendances' do
          assc = Event.reflect_on_association(:event_attendees)
          expect(assc.macro).to eq :has_many
        end

        it 'has many attendees' do
          assc = Event.reflect_on_association(:attendees)
          expect(assc.macro).to eq :has_many
        end
      end
    end

end
