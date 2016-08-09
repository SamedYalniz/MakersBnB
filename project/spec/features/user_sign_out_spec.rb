feature 'user sign out' do
  scenario 'user can sign out' do
    sign_up
    click_button('Sign out')
    expect(page).not_to have_content('Welcome, Bart!')
  end
end
