require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/phone')
require('./lib/contact')

get("/") do
	
	erb(:index)
end

post("/add") do
	name = params.fetch('name')
  number = params.fetch('number')
  contact = Contact.new({ :name => name, :number => number })
	redirect("/")
end

get("/reset") do
	Contact.clear()
	redirect("/")
end

post("/delete") do
  name = params['name']
  number = params['number']
  if name == ""
    name = nil
  end
  if number == ""
    number = nil
  end
	contact = Contact.search({ :name => name, :number => number})
	if contact
		contact.delete_contact()
	end
	redirect("/")
end