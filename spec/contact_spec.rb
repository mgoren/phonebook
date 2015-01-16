require('rspec')
require('contact')

describe(Contact) do

	describe('#name') do
		it("returns name when called on a Contact") do
			me = Contact.new({ :name => "Mike", :number => "314-159-2653"})
			expect(me.number()).to(eq("314-159-2653"))
		end
	end	

end