require 'rails_helper'

describe 'Posts', type: 'feature' do

  describe 'new' do

    before :each do
      @cool = Category.create(name: 'Cool')
      visit 'posts/new'
      fill_in('post_title', :with => 'Feeling Awesome')
      fill_in('post_content', :with => 'This is going to be an awesome post!')
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
end
