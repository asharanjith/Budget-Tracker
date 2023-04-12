require 'rails_helper'

RSpec.describe 'expenses/index', type: :feature do
  describe 'expenses/index' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@example.com', password: 'password',
                           password_confirmation: 'password')
      @group = Group.create!(name: 'Test Group', icon: 'test.png', user: @user)
      @expense = Expense.create!(name: 'Test Expense', amount: 100, author: @user, groups: [@group])

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
    end

    it 'displays the expense name' do
      visit group_expenses_path(group_id: @group.id)
      expect(page).to have_content('Test Expense')
    end

    it 'displays the expense amount' do
      visit group_expenses_path(group_id: @group.id)
      expect(page).to have_content('100')
    end
  end
end
