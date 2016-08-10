
[1] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> User.all
=> [#<User @id=1 @first_name="Bart" @last_name="Kluczynski" @email_address="bkluczynski@gmail.com" @password_digest="$2a$10$32/.vAG99DpDZPdaT8oI/u.6yBsOHuLpQrT4Kf8fEYfHIqFEfxu0W">, #<User @id=2 @first_name="Bart" @last_name="Kluczynski" @email_address="s.yalniz@gmail.com" @password_digest="$2a$10$7c8O0RFhO2yCn2TLinS2EOuPWSr67paJoNzRoim8dxuUrDzwDG.bW">]
[2] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> bart = User.first
=> #<User @id=1 @first_name="Bart" @last_name="Kluczynski" @email_address="bkluczynski@gmail.com" @password_digest="$2a$10$32/.vAG99DpDZPdaT8oI/u.6yBsOHuLpQrT4Kf8fEYfHIqFEfxu0W">
[3] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed = User.first(id: 2)
=> #<User @id=2 @first_name="Bart" @last_name="Kluczynski" @email_address="s.yalniz@gmail.com" @password_digest="$2a$10$7c8O0RFhO2yCn2TLinS2EOuPWSr67paJoNzRoim8dxuUrDzwDG.bW">
[4] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> Request.all
=> [#<Request @id=1 @date="16/01/28">]
[5] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> Request.first
=> #<Request @id=1 @date="16/01/28">
[6] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> Request.first.space
=> #<Space @id=1 @name="Barts Place" @description=<not loaded> @price="40" @available_from=#<Date: 2016-08-15 ((2457616j,0s,0n),+0s,2299161j)> @available_to=#<Date: 2016-09-15 ((2457647j,0s,0n),+0s,2299161j)>>
[7] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> request = Request.first
=> #<Request @id=1 @date="16/01/28">
[8] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> request.user
=> nil
[9] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> request.user = samed
=> #<User @id=2 @first_name="Bart" @last_name="Kluczynski" @email_address="s.yalniz@gmail.com" @password_digest="$2a$10$7c8O0RFhO2yCn2TLinS2EOuPWSr67paJoNzRoim8[10] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.requests << request
[10] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.requests << request
=> [#<Request @id=1 @date="16/01/28">]
[11] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.requests.first.space.name
=> "Barts Place"
[12] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.save
TypeError: no implicit conversion of Space into Array
from /Users/syalniz/.rvm/gems/ruby-2.3.1/gems/dm-core-1.2.1/lib/dm-core/collection.rb:703:in `-'
[13] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.save!
TypeError: no implicit conversion of Space into Array
from /Users/syalniz/.rvm/gems/ruby-2.3.1/gems/dm-core-1.2.1/lib/dm-core/collection.rb:703:in `-'
[14] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.spaces
=> [#<Space @id=2 @name=nil @description=nil @price=nil @available_from=nil @available_to=nil>]
[15] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> Spaces.all
NameError: uninitialized constant Spaces
Did you mean?  Space
from (pry):15:in `block (2 levels) in <top (required)>'
[16] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> Space.all
=> [#<Space @id=1 @name="Barts Place" @description=<not loaded> @price="40" @available_from=#<Date: 2016-08-15 ((2457616j,0s,0n),+0s,2299161j)> @available_to=#<Date: 2016-09-15 ((2457647j,0s,0n),+0s,2299161j)>>, #<Space @id=2 @name=nil @description=<not loaded> @price=nil @available_from=nil @available_to=nil>]
[17] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> Space.first(id: 2).destroy
=> false
[18] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> bart.save
=> true
[19] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> request.save
TypeError: no implicit conversion of Space into Array
from /Users/syalniz/.rvm/gems/ruby-2.3.1/gems/dm-core-1.2.1/lib/dm-core/collection.rb:703:in `-'
[20] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> request.space
=> #<Space @id=1 @name="Barts Place" @description=<not loaded> @price="40" @available_from=#<Date: 2016-08-15 ((2457616j,0s,0n),+0s,2299161j)> @available_to=#<Date: 2016-09-15 ((2457647j,0s,0n),+0s,2299161j)>>
[21] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> space
NameError: undefined local variable or method `space' for #<RSpec::ExampleGroups::UserBooksANewSpace:0x007f85f3ce6708>
from /Users/syalniz/.rvm/gems/ruby-2.3.1/gems/rspec-expectations-3.5.0/lib/rspec/matchers.rb:967:in `method_missing'
[22] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> space = Space.first
=> #<Space @id=1 @name="Barts Place" @description=<not loaded> @price="40" @available_from=#<Date: 2016-08-15 ((2457616j,0s,0n),+0s,2299161j)> @available_to=#<Date: 2016-09-15 ((2457647j,0s,0n),+0s,2299161j)>>
[23] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> space.requests
=> [#<Request @id=1 @date="16/01/28">]
[24] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> space.save
=> true
[25] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed
=> #<User @id=2 @first_name="Bart" @last_name="Kluczynski" @email_address="s.yalniz@gmail.com" @password_digest="$2a$10$7c8O0RFhO2yCn2TLinS2EOuPWSr67paJoNzRoim8dxuUrDzwDG.bW">
[26] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> request.user = samed
=> #<User @id=2 @first_name="Bart" @last_name="Kluczynski" @email_address="s.yalniz@gmail.com" @password_digest="$2a$10$7c8O0RFhO2yCn2TLinS2EOuPWSr67paJoNzRoim8[27] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.requests << request
[27] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.requests << request
=> [#<Request @id=1 @date="16/01/28">, #<Request @id=1 @date="16/01/28">]
[28] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.save
TypeError: no implicit conversion of Space into Array
from /Users/syalniz/.rvm/gems/ruby-2.3.1/gems/dm-core-1.2.1/lib/dm-core/collection.rb:703:in `-'
[29] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.update
DataMapper::UpdateConflictError: User#update cannot be called on a dirty resource
from /Users/syalniz/.rvm/gems/ruby-2.3.1/gems/dm-core-1.2.1/lib/dm-core/resource.rb:1167:in `assert_update_clean_only'
[30] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)> samed.save!
TypeError: no implicit conversion of Space into Array
from /Users/syalniz/.rvm/gems/ruby-2.3.1/gems/dm-core-1.2.1/lib/dm-core/collection.rb:703:in `-'
[31] pry(#<RSpec::ExampleGroups::UserBooksANewSpace>)>
