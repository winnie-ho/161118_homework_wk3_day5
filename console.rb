require ('pry-byebug')
require_relative ('models/customer')
require_relative ('models/film')
require_relative ('models/ticket')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


customer1 = Customer.new({
  "name" =>"Winnie Ho",
  "funds" => 30.00
  })
customer1.save()


customer2 = Customer.new({
  "name" =>"Federico Zucco",
  "funds"=> 50.00
  })
customer2.save()

customer3 = Customer.new({
  "name" => "Adam Natrass",
  "funds" => 20.00
  })
customer3.save()


film1 = Film.new({
  "title" => "Nerve",
  "price" => 7.80
  })
film1.save()


film2 = Film.new({
  "title" => "Finding Dory",
  "price" => 6.20
  })
film2.save()

film3 = Film.new({
  "title" => "Jack Reacher",
  "price" => 7.20
  })
film3.save()

ticket1 = Ticket.new({
  "customer_id" => customer3.id,
  "film_id" => film2.id
  })
ticket1.save()

ticket2 = Ticket.new({
  "customer_id" => customer2.id,
  "film_id" => film3.id
  })
ticket2.save()

ticket3 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film3.id
  })
ticket2.save()

customer1.funds = 100.00
customer1.update()

film1.price = 1.00
film1.update()


customer1.buy_ticket(film2)


binding.pry
nil