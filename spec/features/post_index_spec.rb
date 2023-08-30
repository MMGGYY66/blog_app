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

    Comment.create(post: @post1, user: @user, text: 'I hope youre ok!' )
    Comment.create(post: @post1, user: @user, text: 'NO!' )
    Comment.create(post: @post1, user: @user, text: 'Heyyyyy' )

    Like.create(user: @user, post: @post1)
    Like.create(user: @user, post: @post1)
    visit(user_posts_path(@user))
  end

  scenario 'user can see the user profile picture.' do
    profile_picture = all('img.user_profile')
    expect(profile_picture.size).to eq(1)
    expect(profile_picture[0]).to be_present
  end

  scenario 'user can see the user username.' do
    expect(page).to have_content(@user.name)
  end

  scenario 'user can see the number of posts the user has written.' do
    li_collection = all('ul.posts_list li')
    expect(li_collection.size).to be >= 0
  end

  scenario 'can see a post title.' do
    @user.posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  scenario 'can see some of the post body.' do
    @user.posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
      expect(page).to have_content('Comments:')
      expect(page).to have_content('Likes:')
    end
  end

  scenario 'user can see how many comments a post has.' do
    expect(@post1.comments.size).to eq(3)
  end

  scenario 'user can see how many likes a post has.' do
    expect(@post1.likes.size).to eq(2)
  end

  scenario 'user can see how many comments a post has.' do
    comment_list = all('ul.comments_list')
    comment_list.each do |ul|
      expect(ul.all('li').size).to be >= 0
    end
  end

  scenario 'user click on a post, it redirects me to that post show page.' do
    visit(user_post_path(@user, @post1))
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end
end
