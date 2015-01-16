class Phone

	attr_reader(:numbers)

	define_method(:initialize) do
		@numbers = []
	end

	define_method(:add_number) do |number|
		@numbers.push(number)
	end
	





end