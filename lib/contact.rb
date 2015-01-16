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
		id = 0
		@@contacts.each() do |contact|
			if contact.name() == name_to_search || contact.number() == number_to_search
				id = contact.id()
			end
		end
		id
	end





end