
def create_space(name)
  visit '/spaces/new'
   fill_in('SpaceName', with: name)
   click_button('Create')

end
