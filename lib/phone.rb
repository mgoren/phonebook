class Phone

	attr_reader(:number, :type)

	define_method(:initialize) do |number, type|
		@number = number
		@type = type
	end

end