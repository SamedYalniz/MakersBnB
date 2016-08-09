feature 'User sign in' do
  let!(:user) do
    User.create(email_address: "s.yalniz@hotmail.de",first_name: "Samed",last_name: "Yalniz",password: "password123",password_confirmation: "password123")
  end

  scenario'with correct credentials' do
    sign_in(email_address: user.email_address, password: user.password)
    expect(page).to have_content("Welcome, Samed!")
  end

  scenario 'with incorrect credentials' do
    sign_in(email_address: "s.yalniz@hotmail.de", password: "password")
    expect(page).to have_content("Email or password is incorrect")
    expect(page).to have_field('email_address', with: "s.yalniz@hotmail.de")
  end

  scenario 'user can sign in from homepage' do
    visit '/'
    click_button 'Sign in'
    expect(current_path).to eq '/sessions/new'
  end
end
