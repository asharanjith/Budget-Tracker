require 'rails_helper'

RSpec.describe 'groups/index', type: :feature do
  describe 'groups/index' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@example.com', password: 'password',
                           password_confirmation: 'password')
      @group = Group.create!(name: 'Test Group', icon: 'test.png', user: @user)

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
    end

    it 'displays the group name' do
      expect(page).to have_content('Test Group')
    end

    it 'displays the group icon' do
      expect(page).to have_css('img[src*="test.png"]')
    end
  end
end
