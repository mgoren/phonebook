require('rspec')
require('contact')

describe(Contact) do

	describe('#number') do
		it("returns number when called on a Contact") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653"})
			expect(me.number()).to(eq("314-159-2653"))
		end
	end	

	describe('#name') do
		it("returns name when called on a Contact") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653"})
			expect(me.name()).to(eq("Mike"))
		end
	end	


end