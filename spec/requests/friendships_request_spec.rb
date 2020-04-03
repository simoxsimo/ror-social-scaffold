require 'rails_helper'

RSpec.describe 'Friendships', type: :feature do
  let(:u2) { User.create(name: 'baba', email: 'baba@com.com', password: '123456') }

  scenario 'User approving or rejecting friend requests status' do
    visit '/users/sign_in'

    fill_in 'Email', with: u2.email
    fill_in 'Password', with: u2.password
    click_button 'Log in'
    expect(find('.notice')).to have_content('Signed in successfully.')
    visit '/users'
    expect(page).to have_text('User profile')
  end

  scenario 'Current user viewing their profile' do
    visit '/users/sign_in'

    fill_in 'Email', with: u2.email
    fill_in 'Password', with: u2.password
    click_button 'Log in'
    expect(find('.notice')).to have_content('Signed in successfully.')
    visit '/users'
    click_link 'My Profile'
    expect(page).to have_text('Name:')
  end

  scenario 'Current user adding a user as friend' do
    visit '/users/sign_in'

    fill_in 'Email', with: u2.email
    fill_in 'Password', with: u2.password
    click_button 'Log in'
    expect(find('.notice')).to have_content('Signed in successfully.')
    visit '/users'
    expect(page).to have_text('N')
  end
end
