require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.new(name: 'Ahmad', posts_counter: 0) }

  let(:post) {
    Post.new(author: author, title: 'Day of the Week', comments_counter: 0, likes_counter: 0)
  }

  it 'This should be in-valid, title = nil' do
    post.title = nil
    expect(post).not_to be_valid
  end

  it 'This should be in-valid, title greater than 250 character' do
    post.title = 'title' * 251
    expect(post).not_to be_valid
  end

  it 'This should be in-valid, comments_counter = cd' do
    post.comments_counter = 'cd'
    expect(post).not_to be_valid
  end

  it 'This should be valid' do
    expect(post).to be_valid
  end

  it 'Should return 5 Recent comments' do
    author.save

    post1 = Post.create(author: author, title: 'Coding day', comments_counter: 0, likes_counter: 0)

    comment1 = Comment.create(user: author, post: post1, text: 'nice')
    comment2 = Comment.create(user: author, post: post1, text: 'good')
    comment3 = Comment.create(user: author, post: post1, text: 'bad')
    comment4 = Comment.create(user: author, post: post1, text: 'wonderfull')
    comment5 = Comment.create(user: author, post: post1, text: 'happy')
    comment6 = Comment.create(user: author, post: post1, text: 'not too bad')

    expect(Post.recent_comments(post1)).to eq([comment6, comment5, comment4, comment3, comment2])
  end

  it 'Should update comments counter for post' do
    author.save

    post1 = Post.create(author: author, title: 'Coding day', comments_counter: 0, likes_counter: 0)

    comment1 = Comment.create(user: author, post: post1, text: 'nice')
    comment2 = Comment.create(user: author, post: post1, text: 'good')

    expect(post1.comments_counter).to eq(2)
  end
end
