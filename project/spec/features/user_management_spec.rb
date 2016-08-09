feature 'user sign up' do
  scenario 'requires a matching confirmation password' do
    sign_up
    expect{sign_up(password_confirmation: "wrong")}.not_to change(User,:count)
    within 'ul#errors' do
      expect(page).to have_content("Password does not match the confirmation")
    end
  end

  scenario 'requires a valid email address' do
    expect {sign_up(email_address: 'abc')}.not_to change(User, :count)
    within 'ul#errors' do
      expect(page).to have_content("Email address has an invalid format")
    end
  end

  scenario 'user cannot sign up without an email address' do
    expect {sign_up(email_address: nil)}.not_to change(User, :count)
    within 'ul#errors' do
      expect(page).to have_content("Email address must not be blank")
    end
  end

  scenario 'user cannot sign up with an existing email address' do
    sign_up
    expect {sign_up(email_address: "bkluczynski@gmail.com")}.not_to change(User, :count)
    within 'ul#errors' do
      expect(page).to have_content("Email address is already taken")
    end
  end

end
