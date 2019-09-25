require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:creator) { User.new(:email => 'mhartl@example.com', :password => 'foobar',
    :password_confirmation => 'foobar') }

    subject(:event) do
      described_class.new title: title, description: description, date: date, location: location,
      creator_id: creator.id
    end

    let(:title) { 'Katherine' }
    let(:description) { 'Kathy@yahoo.co.uk' }
    let(:date) { '11/12/2019' }
    let(:location) { 'foobar' }
    #let(:creator_id)  {creator.id}
  # it{is_expected.to be_valid}

    context 'with a title that is blank' do
      let(:title) { ' ' }
      it { is_expected.to_not be_valid }
    end

    context 'with an description that is blank' do
      let(:description) { ' ' }
      it { is_expected.to_not be_valid }
    end

    context 'with all fields present' do
      let(:title) { 'Katherine' }
      let(:description) { 'Kathy@yahoo.co.uk' }
      let(:date) { '11/12/2019' }
      let(:location) { 'foobar' }
      #let(:creator_id) {creator.id}
      it { is_expected.to be_valid }
    end

    context 'title with over 30 characters' do
      let(:title) { 'Antidisestermentarialism...really really long name' }
      it { is_expected.to_not be_valid }
    end

    context 'title with less than 4 characters' do
      let(:title) { 'xte' }
      it { is_expected.to_not be_valid }
    end

    context 'description with over 400 characters' do
      let(:description) { 'a' * 401 + '@example.com' }
      it { is_expected.to_not be_valid }
    end

    context 'description format validation' do
      let(:description) { %w[user@example,com user_at_foo.org user.name@example.
        foo@bar_baz.com foo@bar+baz.com] }
      it { is_expected.to_not be_valid }
    end

    context 'with a date (nonblank)' do
      let(:date) { '11/12/2019' }
      it { is_expected.to_not be_valid }
    end


    context 'with a location that is blank' do
      let(:location) { ' ' }
      it { is_expected.to_not be_valid }
    end

    context 'with an location' do
      let(:description){ ' ' }
      it { is_expected.to_not be_valid }
    end

    describe 'Associations' do
      it { should belong_to(:creator) }
    end
end
