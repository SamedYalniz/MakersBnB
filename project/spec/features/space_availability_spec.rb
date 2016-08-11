feature 'available spaces' do
  scenario 'only list spaces that are available' do
    sign_up
    create_space(name: 'Second Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/2015', available_to: '16/09/2015')
    require 'pry'; binding.pry
    fill_in('available_from', with: '16/08/2015')
    fill_in('available_to', with: '19/08/2015')
    click_button('List Available Spaces')
    expect(page).to have_content('Second Place')
  end
end
