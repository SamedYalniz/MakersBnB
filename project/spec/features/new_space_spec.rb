
feature 'user creates new space' do
  scenario 'add new space to advertise' do
   #expecting a web-helper to automate log-ins
    visit '/spaces/new'

   expect(page.status_code).to eq(200)
   fill_in('SpaceName', with: 'Barts Place')
   click_button('Create')
   expect(current_path).to eq('/spaces')
   within'ul#spaces' do
     expect(page).to have_content('Barts Place')
   end

   end


  scenario 'I can see existing spaces' do
    Space.create(name: 'Barts Place')
    visit'/spaces'
    expect(page.status_code).to eq(200)
    within'ul#spaces' do
      expect(page).to have_content('Barts Place')
    end
  end

  scenario 'add new spaces' do
    create_space('Sameds Place')
    visit '/spaces/new'

   expect(page.status_code).to eq(200)
   fill_in('SpaceName', with: 'Barts Place')
   click_button('Create')
   expect(current_path).to eq('/spaces')
   within'ul#spaces' do
     expect(page).to have_content('Barts Place')
     expect(page).to have_content('Sameds Place')
   end

   end

end
