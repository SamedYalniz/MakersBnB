
feature 'user books a new space' do

   scenario 'booking a space' do
     sign_up
     create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
     visit('/spaces')
     within 'ul#spaces' do
       click_button('Barts Place')
     end
     expect(page).to have_content('Pick a night')
     find_field('calender').value
     click_button('Request to book')
     expect(page).to have_content('The request to book has been delivered')
   end

end
