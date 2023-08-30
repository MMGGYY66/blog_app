require 'rails_helper'

RSpec.describe 'User show page' do
  before(:each) do
    @user = User.create(name: 'Mohammad', photo: 'https://example.jpg', bio: 'Eng')
    @post = Post.create(author: @user, title: 'My lovely day', text: 'text for the post')

    @comment1 = Comment.create(post: @post, user: @user, text: 'I hope youre ok!')
    @comment2 = Comment.create(post: @post, user: @user, text: 'NO!')
    @comment3 = Comment.create(post: @post, user: @user, text: 'Heyyyyy')

    Like.create(user: @user, post: @post)
    Like.create(user: @user, post: @post)
    visit(user_post_path(@user, @post))
  end

  scenario 'user can see the post title.' do
    expect(page).to have_content(@post.title)
  end

  scenario 'user can see who wrote the post.' do
    expect(page).to have_content(@post.author.name)
  end

  scenario 'user can see how many comments it has.' do
    expect(page).to have_content('Comments: 3')
  end

  scenario 'user can see how many likes it has.' do
    expect(page).to have_content('Likes: 2')
  end

  scenario 'user can see the post body.' do
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.text)
    expect(page).to have_content(@post.comments_counter)
    expect(page).to have_content(@post.likes_counter)
  end

  scenario 'user can see the username of each commentor.' do
    expect(page).to have_content(@comment1.user.name)
    expect(page).to have_content(@comment2.user.name)
    expect(page).to have_content(@comment3.user.name)
  end
end
