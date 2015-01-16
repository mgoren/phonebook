require('rspec')
require('contact')
require('phone')

describe(Contact) do

	before() do
		Contact.clear()
	end

	describe('#phones') do
		it("returns array of Phone objects when called on a Contact") do
			me = Contact.new("Mike")
			me.add_number("444-444-4444", "mobile")
			expect(me.phones()[0].number()).to(eq("444-444-4444"))
		end
	end

	describe('#name') do
		it("returns name when called on a Contact") do
			me = Contact.new("Mike")
			me.add_number("444-444-4444", "mobile")
			expect(me.name()).to(eq("Mike"))
		end
	end	

	describe('.list_all_names') do
		it("lists all contacts' names") do
			me = Contact.new("Mike")
			friend = Contact.new("Anna")
			friend2 = Contact.new("Dan")
			me.add_number("444-444-4444", "mobile")
			me.add_number("555-555-5555", "home")
			friend.add_number("123-456-7890", "home")
			friend2.add_number("333-333-3333", "home")
			expect(Contact.list_all_names()).to(eq(["Mike", "Anna", "Dan"]))
		end
	end

	describe('.search') do
		
		it("returns Contact object given name") do
			me = Contact.new("Mike")
			friend = Contact.new("Anna")
			friend2 = Contact.new("Dan")
			me.add_number("444-444-4444", "mobile")
			me.add_number("555-555-5555", "home")
			friend.add_number("123-456-7890", "home")
			friend2.add_number("333-333-3333", "home")
			expect(Contact.search({ :name => "Dan" })).to(eq(friend2))
		end

		it("returns Contact object given number") do
			me = Contact.new("Mike")
			friend = Contact.new("Anna")
			friend2 = Contact.new("Dan")
			me.add_number("444-444-4444", "mobile")
			me.add_number("555-555-5555", "home")
			friend.add_number("123-456-7890", "home")
			friend2.add_number("333-333-3333", "home")
			expect(Contact.search({ :number => "444-444-4444" })).to(eq(me))
		end

		it("returns nil if contact not found") do
			me = Contact.new("Mike")
			friend = Contact.new("Anna")
			friend2 = Contact.new("Dan")
			me.add_number("444-444-4444", "mobile")
			me.add_number("555-555-5555", "home")
			friend.add_number("123-456-7890", "home")
			friend2.add_number("333-333-3333", "home")
			expect(Contact.search({ :name => "not in phone book" })).to(eq(nil))
		end

	end

	describe('find_numbers') do
		it("returns array of numbers given name") do
			me = Contact.new("Mike")
			friend = Contact.new("Anna")
			friend2 = Contact.new("Dan")
			me.add_number("444-444-4444", "mobile")
			me.add_number("555-555-5555", "home")
			friend.add_number("123-456-7890", "home")
			friend2.add_number("333-333-3333", "home")
			expect(Contact.find_numbers("Mike")).to(eq(["444-444-4444", "555-555-5555"]))
		end
	end

	describe('find_name') do
		it("returns name given number") do
			me = Contact.new("Mike")
			friend = Contact.new("Anna")
			friend2 = Contact.new("Dan")
			me.add_number("444-444-4444", "mobile")
			me.add_number("555-555-5555", "home")
			friend.add_number("123-456-7890", "home")
			friend2.add_number("333-333-3333", "home")
			expect(Contact.find_name("444-444-4444")).to(eq("Mike"))
		end
	end

	describe('delete_contact') do
		it("deletes self from @@contacts") do
			me = Contact.new("Mike")
			friend = Contact.new("Anna")
			friend2 = Contact.new("Dan")
			me.add_number("444-444-4444", "mobile")
			me.add_number("555-555-5555", "home")
			friend.add_number("123-456-7890", "home")
			friend2.add_number("333-333-3333", "home")
			me.delete_contact()
			expect(Contact.search({ :name => "Mike" })).to(eq(nil))
		end
	end

	describe('#numbers') do
		it("returns an array of numbers given Contact") do
			me = Contact.new("Mike")
			friend = Contact.new("Anna")
			friend2 = Contact.new("Dan")
			me.add_number("444-444-4444", "mobile")
			me.add_number("555-555-5555", "home")
			friend.add_number("123-456-7890", "home")
			friend2.add_number("333-333-3333", "home")
			expect(me.numbers()).to(eq(["444-444-4444", "555-555-5555"]))
		end
	end



end