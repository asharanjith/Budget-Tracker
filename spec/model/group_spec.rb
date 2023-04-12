require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:userone) do
    User.new(name: 'Test User', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
  end

  let(:groupone) do
    Group.new(name: 'Test Group', icon: 'test.png', user: userone)
  end

  it 'is valid with valid attributes' do
    expect(groupone).to be_valid
  end

  it 'is not valid without a name' do
    groupone.name = nil
    expect(groupone).to_not be_valid
  end

  it 'is not valid without an icon' do
    groupone.icon = nil
    expect(groupone).to_not be_valid
  end

  it 'is not valid without a user_id' do
    groupone.user = nil
    expect(groupone).to_not be_valid
  end
end
