feature 'user sign up' do
  scenario 'requires a matching confirmation password' do
    sign_up
    expect{sign_up(password_confirmation: "wrong")}.not_to change(User,:count)
    require 'pry'; binding.pry
    within 'ul#errors' do
      expect(page).to have_content("Password does not match the confirmation")
    end 
  end

end
