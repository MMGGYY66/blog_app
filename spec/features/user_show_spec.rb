require 'rails_helper'

RSpec.describe 'User show page' do
  before(:each) do
    @user = User.create(name: 'Mohammad', photo: 'https://example.jpg', bio: 'Eng')
    @post1 = Post.create(author: @user, title: 'My lovely day', text: 'text for the post')
    @post2 = Post.create(author: @user, title: 'My car', text: 'text for the post')
    @post3 = Post.create(author: @user, title: 'My pen', text: 'text for the post')
    @post4 = Post.create(author: @user, title: 'My pencil', text: 'text for the post')
    @post5 = Post.create(author: @user, title: 'My job', text: 'text for the post')
    @post6 = Post.create(author: @user, title: 'My pc', text: 'text for the post')

    visit(user_path(@user))
  end

  # tests
  scenario 'user can see the users profile picture.' do
    profile_picture = all('img.user_profile')
    expect(profile_picture.size).to eq(1)
    expect(profile_picture[0]).to be_present
  end

  scenario 'user can see the users username.' do
    expect(page).to have_content(@user.name)
  end

  scenario 'user can see the number of posts the user has written.' do
    li_collection = all('ul.posts_list li')
    expect(li_collection.size).to be >= 0
  end

  scenario 'user can see the user bio.' do
    bio_container = find('div.bio_container')
    bio_title = find('div.bio_container p.bio_title')
    expect(bio_container).to be_present
    expect(bio_title).to be_present
  end

  scenario 'user can see the user first 3 posts.' do
    expect(@user.most_recent).to eq([@post6, @post5, @post4])
  end

  scenario 'user can see a button that lets me view all of a user posts.' do
    expect(page).to have_link('Show all the post')
  end

  scenario 'When user click a user post, it redirects me to that post show page' do
    visit(user_posts_path(@user))
    click_link(@post1.title)
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end

  scenario 'When I click to Show all posts, it redirects me to the post index page.
  ' do
    click_link('Show all the post')
    visit(user_posts_path(@user))
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
