class Contact
	@@contacts = []
	@@id = 0

	attr_reader(:name, :phones, :id)

	define_method(:initialize) do |name|
		@name = name
		@phones = []
		@@id += 1
		@id = @@id
		@@contacts.push(self)
	end

	define_method(:add_number) do |number, type|
		if number != "" && type != ""
			phone = Phone.new(number, type)
			@phones.push(phone)
		end
	end

	define_method(:delete_number) do |number|
		@phones.each() do |phone|
    	if phone.number() == number
      	@phones.delete(phone)
    end
  end

	end

	define_method(:numbers) do
		numbers = []
		@phones.each() do |phone|
			numbers.push(phone.number())
		end
		numbers
	end

	define_method(:delete_contact) do
		if @@contacts.include?(self)
			@@contacts.delete(self)
		end
	end

	define_singleton_method(:list_all_names) do
		names = []
		@@contacts.each() do |contact|
			names.push(contact.name())
		end
		names
	end

	define_singleton_method(:all) do
		@@contacts
	end

	define_singleton_method(:clear) do
		@@contacts = []
		@@id = 0
	end

	define_singleton_method(:search) do |attributes|
		name_to_search = attributes[:name]
		number_to_search = attributes[:number]
		@@contacts.each() do |contact|
			if contact.name() == name_to_search
				return contact
			else
				contact.phones().each() do |phone|
					if phone.number() == number_to_search
						return contact
					end
				end
			end
		end
		return nil
	end

	define_singleton_method(:find_numbers) do |name_to_search|
		Contact.search({ :name => name_to_search }).numbers()
	end

	define_singleton_method(:find_name) do |number_to_search|
		Contact.search({ :number => number_to_search }).name()
	end

	define_singleton_method(:exists?) do |name_to_search|
		if Contact.search({ :name => name_to_search })
			true
		else
			false
		end
	end

end