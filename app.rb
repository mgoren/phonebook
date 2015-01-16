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

get("/add_number/:name") do
  name = params['name']
  number = params.fetch('number')
  type = params.fetch('type')
  Contact.search({ :name => name }).add_number(number, type)
  redirect("/")
end

get("/reset") do
	Contact.clear()
	redirect("/")
end

get("/edit/:name") do
  @name = params.fetch('name')
	erb(:edit)
end


get("/delete_number/:name/:number") do
  name = params['name']
  number = params['number']
  contact = Contact.search({ :name => name, :number => number })
  contact.phones().each() do |phone|
    if phone.number() == number
      contact.phones().delete(phone)
    end
  end
	redirect("/")
end

get("/delete_entry/:name") do
  name = params['name']
  Contact.search({ :name => name }).delete_contact()
  redirect("/")
end