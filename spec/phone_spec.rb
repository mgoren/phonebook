require('rspec')
require('phone')
require('contact')

describe(Phone) do

	describe('#numbers') do
		it("returns array of all numbers in that phone book entry") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			me.phone().add_number("555-555-5555")
			me.phone().add_number("999-999-9999")
			expect(me.phone().numbers()).to(eq(["314-159-2653", "555-555-5555", "999-999-9999"]))
		end
	end

	describe('#delete_number') do
		it("deletes number from array of numbers when called on that phone book entry") do
						me = Contact.new({ :name => "Mike", :number => "314-159-2653" })
			me.phone().add_number("555-555-5555")
			me.phone().add_number("999-999-9999")
			me.phone().delete_number("555-555-5555")
			expect(me.phone().numbers()).to(eq(["314-159-2653", "999-999-9999"]))
		end
	end



end