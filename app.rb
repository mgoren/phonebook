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
  if name != "" && number != "" && type != "" && Contact.exists?(name) == false
    contact = Contact.new(name)
    contact.add_number(number, type)
  end
	redirect("/")
end

get("/add_number/:name") do
  name = params['name']
  number = params.fetch('number')
  type = params.fetch('type')
  Contact.search({ :name => name }).add_number(number, type)
  url = "/edit/" + name
  redirect(url)
end

get("/reset") do
	Contact.clear()
	redirect("/")
end

get("/edit/:name") do
  @name = params['name']
	erb(:edit)
end


get("/delete_number/:name/:number") do
  name = params['name']
  number = params['number']
  Contact.search({ :name => name, :number => number }).delete_number(number)
  url = "/edit/" + name
	redirect(url)
end

get("/delete_entry/:name") do
  name = params['name']
  Contact.search({ :name => name }).delete_contact()
  redirect("/")
end