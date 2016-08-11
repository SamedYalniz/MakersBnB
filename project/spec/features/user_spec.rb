require 'web_helper'

feature 'adding a new user' do
  scenario 'allows to increase the user count by one' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Bart')
    expect(User.first.email_address).to eq("bkluczynski@gmail.com")
  end
end
