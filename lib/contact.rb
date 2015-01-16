class Contact
	@@contacts = []

	attr_reader(:name, :number)

	define_method(:initialize) do |attributes|
		@name = attributes.fetch(:name)
		@number = attributes.fetch(:number)
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
	end


end