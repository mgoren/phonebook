class Contact
	@@contacts = []
	@@id = 0

	attr_reader(:name, :number, :id)

	define_method(:initialize) do |attributes|
		@name = attributes.fetch(:name)
		@number = attributes.fetch(:number)
		@@id += 1
		@id = @@id
		@@contacts.push(self)
	end

	define_singleton_method(:list_all_names) do
		names = []
		@@contacts.each() do |contact|
			names.push(contact.name())
		end
		names
	end

	define_singleton_method(:clear) do
		@@contacts = []
		@@id = 0
	end

	define_singleton_method(:search) do |attributes|
		name_to_search = attributes[:name]
		number_to_search = attributes[:number]
		@@contacts.each() do |contact|
			if contact.name() == name_to_search || contact.number() == number_to_search
				return contact
			end
		end
		return nil
	end

	define_singleton_method(:find_number) do |name_to_search|
		Contact.search({ :name => name_to_search }).number()
	end

	define_singleton_method(:find_name) do |number_to_search|
		Contact.search({ :number => number_to_search }).name()
	end
	






end