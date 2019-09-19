require 'rails_helper'

RSpec.describe User, type: :model do
  context 'name and email is not present' do
    subject { User.create(name: ' ', email: ' ') }
    #byebug
    it 'is not valid' do
      expect(subject).to_not be_valid
    end
  end

  context 'all fields present' do
    subject { User.create(name: 'Another User', email: 'auser@example.com ') }
    #byebug
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'name should not be too long' do
  #muser = User.create(name: 'Another User', email: 'auser@example.com ')
  usename = 49
   it 'is too long' do
     expect(usename).to be_within(10).of(51)
   end
  end
end
