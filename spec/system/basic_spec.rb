# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user) { create(:user) }
  let!(:tree) { create(:tree, user: user) }

  describe 'before login' do
    it 'can create new user' do
      visit '/'
      click_link 'Login'
      click_link 'Create_user'
      fill_in 'User name', with: 'piyo'
      fill_in 'Email', with: 'piyp@example.com'
      fill_in 'Password', with: 'piyo'
      fill_in 'Password confirmation', with: 'piyo'
      click_button 'create'
      expect(page).to have_content('User was successfully created.')
      expect(current_path).to eq login_path
    end
    it 'can login' do
      visit '/'
      click_link 'Login'
      fill_in 'Email', with: 'hoge@example.com'
      fill_in 'Password', with: 'hoge'
      click_button 'login'
      expect(page).to have_content('Login successful.')
      expect(current_path).to eq root_path
    end
    it 'can see all trees' do
      visit '/'
      click_link 'All_trees', match: :first
      click_link 'piyo'
      expect(current_path).to eq tree_layers_path(1)
    end
  end
  describe 'after login' do
    before { login_as(user) }

    it 'can create new tree' do
      visit '/'
      click_link 'Create_tree'
      fill_in 'Title', with: '日本語なら十文字です'
      fill_in 'Description', with: 'eigonara20jimadedesu'
      click_button 'create'
      expect(current_path).to eq tree_layers_path(2)
    end
    it 'can edit tree' do
      visit '/'
      click_link 'user:hoge'
      expect(current_path).to eq user_path(user)
      expect(page).to have_content('piyo')
      expect(page).to have_content('fuga')
      click_link 'edit'
      fill_in 'Title', with: 'check'
      fill_in 'Description', with: 'test'
      click_button 'edit'
      expect(current_path).to eq user_path(user)
      expect(page).to have_content('test')
      expect(page).to have_content('check')
    end
    it 'can delete tree' do
      visit '/'
      click_link 'user:hoge'
      click_link 'delete'
      page.driver.browser.switch_to.alert.accept
      expect(current_path).to eq user_path(user)
      expect(page).not_to have_content('test')
      expect(page).not_to have_content('check')
    end
    it 'can change tree status to private' do
      visit '/'
      click_link 'All_trees', match: :first
      expect(current_path).to eq trees_path
      expect(page).to have_content('piyo')
      expect(page).to have_content('fuga')
      click_link 'user:hoge'
      click_link 'public_tree'
      click_link 'All_trees'
      expect(current_path).to eq trees_path
      expect(page).not_to have_content('piyo')
      expect(page).not_to have_content('fuga')
    end
    it 'can edit user account' do
      visit '/'
      click_link 'user:hoge'
      click_link 'Edit_user'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'test'
      click_button 'edit'
      click_link 'Logout'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'test'
      click_button 'login'
      expect(current_path).to eq root_path
      expect(page).to have_content('Login successful.')
    end
  end
end
