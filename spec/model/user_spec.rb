require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save when all fields are present' do
      @user = User.new(
        name: 'Test User',
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it 'should not save when password and password_confirmation do not match' do
      @user = User.new(
        name: 'Test User',
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password1'
      )
      expect(@user).to_not be_valid
    end

    it 'should not save when password is not present' do
      @user = User.new(
        name: 'Test User',
        email: 'test@gmail.com',
        password: nil,
        password_confirmation: 'password1'
      )

      expect(@user).to_not be_valid
    end
  end
end
