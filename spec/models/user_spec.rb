require 'rails_helper'

RSpec.describe User, type: :model do
<<<<<<< HEAD

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
=======
  subject(:user) do
    described_class.new name: name, email: email, password: password, password_confirmation: password_confirmation
  end

  let(:name) { 'Katherine' }
  let(:email) { 'Kathy@yahoo.co.uk' }
  let(:password) { 'foobar' }
  let(:password_confirmation) { 'foobar' }

  it { is_expected.to be_valid }

  context 'with a name that is blank' do
    let(:name) { ' ' }
    it { is_expected.to_not be_valid }
  end

  context 'with an email that is blank' do
    let(:email) { ' ' }
    it { is_expected.to_not be_valid }
  end

  context 'all fields present' do
    let(:name) { 'Katherine' }
    let(:email) { 'Kathy@yahoo.co.uk' }

    it { is_expected.to be_valid }
  end

  context 'name with over 20 characters' do
    let(:name) { 'Antidisestermentarialism...really really long name' }
    it { is_expected.to_not be_valid }
  end

  context 'name with less than 4 characters' do
    let(:name) { 'xte' }
    it { is_expected.to_not be_valid }
  end

  context 'email with over 255 characters' do
    let(:email) { 'a' * 244 + '@example.com' }
    it { is_expected.to_not be_valid }
  end

  context 'email format validation' do
    let(:email) { %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com] }
      it { is_expected.to_not be_valid }
  end

  context 'with a password (nonblank)' do
    let(:password) { ' ' * 6 }
    it { is_expected.to_not be_valid }
  end

  context 'password with a minimum length' do
    let(:password_confirmation) { 'a' * 5 }
    it { is_expected.to_not be_valid }
>>>>>>> 0d36ce64fa941d89f6dc182548d194166f04275a
  end

end
