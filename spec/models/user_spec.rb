require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Ahmad', posts_counter: 0) }

  it 'This should be in-valid, name = nil' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'This should be in-valid, posts_counter = a' do
    user.posts_counter = 'a'
    expect(user).not_to be_valid
  end

  it 'This should be valid' do
    expect(user).to be_valid
  end

  it 'Should return 3 most recents' do
    user.save
    Post.create(author: user, title: 'Days of the week', comments_counter: 0, likes_counter: 0)

    post2 = Post.create(author: user, title: 'Happy Months', comments_counter: 0, likes_counter: 0)

    post3 = Post.create(author: user, title: 'Coding day', comments_counter: 0, likes_counter: 0)

    post4 = Post.create(author: user, title: 'Happy year', comments_counter: 0, likes_counter: 0)

    expect(user.most_recent).to eq([post4, post3, post2])
  end
end
