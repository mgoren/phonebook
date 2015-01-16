class Contact

attr_reader(:name, :number)

define_method(:initialize) do |attributes|
	@name = attributes.fetch(:name)
	@number = attributes.fetch(:number)
end





end