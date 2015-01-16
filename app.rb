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
  type = params.fetch('type')
  contact = Contact.new(name)
  contact.add_number(number, type)
	redirect("/")
end

get("/reset") do
	Contact.clear()
	redirect("/")
end

get("/edit") do
	
	erb(:edit)
end


post("/delete") do
  name = params['name']
  number = params['number']
  if number == "" # delete whole contact
    Contact.search({ :name => name }).delete_contact()
  elsif name == "" # delete just this number, not whole contact
    contact = Contact.search({ :number => number })
  end
  
	redirect("/")
end