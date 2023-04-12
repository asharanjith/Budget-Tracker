require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:userone) do
    User.new(name: 'Test User', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
  end

  let(:groupone) do
    Group.new(name: 'Test Group', icon: 'test.png', user: userone)
  end

  let(:expenseone) do
    Expense.new(name: 'Test Expense', amount: 100, author: userone, groups: [groupone])
  end

  it 'is valid with valid attributes' do
    expect(expenseone).to be_valid
  end

  it 'is not valid without a name' do
    expenseone.name = nil
    expect(expenseone).to_not be_valid
  end

  it 'is not valid without an amount' do
    expenseone.amount = nil
    expect(expenseone).to_not be_valid
  end

  it 'is not valid without a user_id' do
    expenseone.author = nil
    expect(expenseone).to_not be_valid
  end

  it 'is not valid without a group_id' do
    expenseone.groups = []
    expect(expenseone).to_not be_valid
  end

  it 'is not valid with a negative amount' do
    expenseone.amount = -100
    expect(expenseone).to_not be_valid
  end

  it 'is not valid with a zero amount' do
    expenseone.amount = 0
    expect(expenseone).to_not be_valid
  end

  it 'is not valid with a non-numeric amount' do
    expenseone.amount = 'test'
    expect(expenseone).to_not be_valid
  end
end
