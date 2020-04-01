require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  let(:name) { 'steve' } 
  let(:email) { 'admin@com.com' } 
  let(:password) { "123456"} 
  let(:user_password_confirmation) { "123456" } 

  
  let(:u2) { User.create(name: 'baba', email: 'baba@com.com', password:"123456") }

  scenario 'User login' do
    visit "/users/sign_in"

    fill_in 'Email', with: u2.email
    fill_in 'Password', with: u2.password
    click_button 'Log in'
    expect(find('.notice')).to have_content('Signed in successfully.')
  end
  scenario 'User register as a user' do
    visit "/users/sign_up"
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'user_password_confirmation', with: user_password_confirmation
    click_button 'Sign up'
    expect(find('.notice')).to have_content('Welcome! You have signed up successfully.')
  end

end
