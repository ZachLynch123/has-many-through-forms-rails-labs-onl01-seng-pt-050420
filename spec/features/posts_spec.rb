require 'rails_helper'

describe 'Posts', type: 'feature' do

  

    it 'can create a post without a new category' do
      click_button('Create Post')
      @categories = Post.last.categories
      expect(@categories).to be_empty
      expect(page).to have_content('Feeling Awesome')
    end

    it 'can create a post with a previously created category' do
      check('Cool')
      click_button('Create Post')
      @category = Post.last.categories.first.name
      expect(@category).to eq('Cool')
    end

    it 'can create a post with a brand new category' do
      fill_in('post_categories_attributes_0_name', :with => 'Funny')
      click_button('Create Post')
      @category = Post.last.categories.first.name
      expect(@category).to eq('Funny')
    end

    it 'can create a post with a brand new category and an existing category' do
      check('Cool')
      fill_in('post_categories_attributes_0_name', :with => 'Funny')
      click_button('Create Post')
      @category1 = Post.last.categories.first.name
      @category2 = Post.last.categories.last.name
      expect(@category1).to eq('Cool')
      expect(@category2).to eq('Funny')
    end
  end

  
end
