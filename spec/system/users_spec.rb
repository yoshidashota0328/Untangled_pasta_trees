require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }
  let!(:tree) { create(:tree, user: user) }

  describe 'before login' do
    it 'is user generated' do
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
    it 'is login' do
      visit '/'
      click_link 'Login'
      fill_in 'Email', with: 'hoge@example.com'
      fill_in 'Password', with: 'hoge'
      click_button 'login'
      expect(page).to have_content('Login successful.')
      expect(current_path).to eq root_path
    end
    it 'is can see all trees' do
      visit '/'
      click_link 'All_trees'
      click_link 'hoge'
      expect(current_path).to eq tree_layers_path(1)
      expect(page).to have_content('hoge')
      find('.tree_title').click
      page.execute_script '$("#tooltip-id1").trigger("mouseover")'
      find('.CodeMirror-scroll').click
      expect(page).to have_content('fuga')
    end
  end
  describe 'after login' do
    before { login_as(user) }
    
    it 'is create new tree' do
      visit '/'
      click_link 'Create_tree'
      fill_in 'Title', with: '日本語なら十文字です'
      fill_in 'Description', with: 'eigonara20mojimadesu'
      click_button 'create'
      expect(current_path).to eq tree_layers_path(2)
    end  
  end
end
