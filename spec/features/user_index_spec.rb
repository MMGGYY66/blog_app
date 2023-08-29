require 'rails_helper'


RSpec.describe 'Users index page', type: :feature do
  before do
    @user1 = User.create(name: 'Mohammad', photo: 'https://example.jpg', bio: 'Eng')
    @user2 = User.create(name: 'John', photo: 'https://example.jpg', bio: 'Dev')
    @user3 = User.create(name: 'Karim', photo: 'https://example.jpg', bio: 'Eng')
    visit('/users')
  end

  scenario 'user can see the username of all users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  scenario 'user can see the profile picture for each user.' do
    expect(page).to have_content('alt="user-img"')
    expect(page).to have_content('alt="user-img"')
    expect(page).to have_content('alt="user-img"')
  end
end
