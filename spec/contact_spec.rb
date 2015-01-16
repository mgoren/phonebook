require('rspec')
require('contact')

describe(Contact) do

	before() do
		Contact.clear()
	end

	describe('#number') do
		it("returns number when called on a Contact") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			expect(me.number()).to(eq("314-159-2653"))
		end
	end	

	describe('#name') do
		it("returns name when called on a Contact") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			expect(me.name()).to(eq("Mike"))
		end
	end	

	describe('.list_all_names') do
		it("lists all contacts' names") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			friend = Contact.new({ :name => "Anna", :number => "123-456-7890" })
			friend2 = Contact.new({ :name => "Dan", :number => "222-222-2222" })
			expect(Contact.list_all_names()).to(eq(["Mike", "Anna", "Dan"]))
		end
	end

	describe('.search') do
		
		it("returns Contact object given name") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			friend = Contact.new({ :name => "Anna", :number => "123-456-7890" })
			friend2 = Contact.new({ :name => "Dan", :number => "222-222-2222" })
			expect(Contact.search({ :name => "Dan" })).to(eq(friend2))
		end

		it("returns Contact object given number") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			friend = Contact.new({ :name => "Anna", :number => "123-456-7890" })
			friend2 = Contact.new({ :name => "Dan", :number => "222-222-2222" })
			expect(Contact.search({ :number => "222-222-2222" })).to(eq(friend2))
		end

		it("returns nil if contact not found") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			friend = Contact.new({ :name => "Anna", :number => "123-456-7890" })
			friend2 = Contact.new({ :name => "Dan", :number => "222-222-2222" })
			expect(Contact.search({ :name => "not in phone book" })).to(eq(nil))
		end

	end

	describe('find_number') do
		it("returns number given name") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			friend = Contact.new({ :name => "Anna", :number => "123-456-7890" })
			friend2 = Contact.new({ :name => "Dan", :number => "222-222-2222" })
			expect(Contact.find_number("Dan")).to(eq("222-222-2222"))
		end
	end

	describe('find_name') do
		it("returns name given number") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			friend = Contact.new({ :name => "Anna", :number => "123-456-7890" })
			friend2 = Contact.new({ :name => "Dan", :number => "222-222-2222" })
			expect(Contact.find_name("314-159-2653")).to(eq("Mike"))
		end
	end



end