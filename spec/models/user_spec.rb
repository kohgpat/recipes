require 'spec_helper'

describe User do
  describe '#validations' do
    it 'should not be valid with invalid attributes' do
      user = User.new
      expect(user).not_to be_valid
    end

    it 'should be valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
