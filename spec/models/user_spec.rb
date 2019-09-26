require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Validation tests' do
    let(:user) { build(:user) }
    it 'ensures name presence' do
      user.name = nil
      expect(user.save).to eq(false)
    end

    it 'checks name with over 20 characters' do
      user.name = 'Antidisestermentarialism...really really long name'
      expect(user.save).to eq(false)
    end

    it 'checks name with less than 4 characters' do
      user.name = 'xte'
      expect(user.save).to eq(false)
    end

    it 'ensures email presence' do
      user.name = 'Don Pablo'
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'checks email with over 255 characters' do
      user.name = 'Don Pablo'
      user.email = 'a' * 244 + '@example.com'
      expect(user.save).to eq(false)
    end

    it 'ensures valid email format' do
      user.name = 'Don Pablo'
      user.email = %w[user@example,com user_at_foo.org user.name@example.
        foo@bar_baz.com foo@bar+baz.com]
      expect(user.save).to eq(false)
    end

    it 'ensures password presence' do
      user.name = 'Don Pablo'
      user.email = 'donPablo@example.com'
      user.password = nil
      expect(user.save).to eq(false)
    end

    it 'checks password with less than 6 characters' do
      user.name = 'Don Pablo'
      user.email = 'donPablo@example.com'
      user.password = 'a' * 5
      expect(user.save).to eq(false)
    end

    it 'ensures all fields are present and it saves successfully' do
      user.name = 'Don Pablo'
      user.email = 'donPablo@example.com'
      user.password = 'barbaz'
      user.password_confirmation = 'barbaz'
      expect(user.save).to eq(true)
    end

  end

  describe 'Associations' do
    it { should have_many(:created_events) }
  end

end
