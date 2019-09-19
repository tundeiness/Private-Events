require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Another User', email: 'auser@example.com ')
  end

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

  context 'name length' do
    it 'should not be longer than 50 characters' do
      @user.name = 'a' * 51
      expect(@user).to_not be_valid
   end
  end

  context 'email length' do
    it 'should not be longer than 255 characters' do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).to_not be_valid
    end
  end
end
