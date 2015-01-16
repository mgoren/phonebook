require('rspec')
require('phone')
require('contact')

describe(Phone) do

	describe('number') do
		it("returns number") do
			me = Contact.new("Mike")
			me.add_number("555-555-5555", "mobile")
			expect(me.phones()[0].number()).to(eq("555-555-5555"))
		end
	end

	describe('type') do
		it("returns type") do
			me = Contact.new("Mike")
			me.add_number("555-555-5555", "mobile")
			expect(me.phones()[0].type()).to(eq("mobile"))
		end
	end


end