require 'rails_helper'

RSpec.describe 'Users index page', type: :feature do
  before do
    @user1 = User.create(name: 'Mohammad', photo: 'https://example.jpg', bio: 'Eng')
    @user2 = User.create(name: 'John', photo: 'https://example.jpg', bio: 'Dev')
    @user3 = User.create(name: 'Karim', photo: 'https://example.jpg', bio: 'Eng')
    visit('/users')
    @users = User.all
  end

  scenario 'user can see the username of all users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  scenario 'user can see the profile picture for each user.' do
    # take all image by class name into array
    all_img = all('img.user_profile')
    expect(all_img.size).to eq(@users.size)

    # each img, should be present
    all_img.each do |img|
      expect(img).to be_present
    end
  end

  scenario 'user can see the number of posts' do
    expect(page).to have_content('Number of Posts: 0')
  end

  scenario 'click on a user, I am redirected to that user show page.' do
    click_link('UserName: Mohammad')
    expect(page).to have_current_path(user_path(@user1))
  end

  scenario 'click on a user, I am redirected to that user show page.' do
    click_link('UserName: Karim')
    expect(page).to have_current_path(user_path(@user3))
  end
end
