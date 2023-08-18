require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.new(name: 'Ahmad', posts_counter: 0) }
  
  it 'Should update like counter for post' do
    author.save

    post1 = Post.create(author: author, title: 'Coding day', comments_counter: 0, likes_counter: 0)

    like1 = Like.create(user: author, post: post1)
    like2 = Like.create(user: author, post: post1)
    like3 = Like.create(user: author, post: post1)
    like4 = Like.create(user: author, post: post1)
    expect(post1.likes_counter).to eq(4)
  end
end
