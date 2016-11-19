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

customer4 = Customer.new({
  "name" => "Tegan Gallacher",
  "funds" => 20.00
  })
customer4.save()

customer5 = Customer.new({
  "name" => "Logan Smith",
  "funds" => 20.00
  })
customer5.save()



film1 = Film.new({
  "title" => "Nerve",
  "price" => 7.80,
  "capacity" => 10
  })
film1.save()

film2 = Film.new({
  "title" => "Finding Dory",
  "price" => 6.20,
  "capacity" => 5
  })
film2.save()

film3 = Film.new({
  "title" => "Jack Reacher",
  "price" => 7.20,
  "capacity" => 2
  })
film3.save()




ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film2.id,
  "film_time" => "20:00"
  })
ticket1.save()

ticket2 = Ticket.new({
  "customer_id" => customer2.id,
  "film_id" => film3.id,
  "film_time" => "19:00"
  })
ticket2.save()

ticket3 = Ticket.new({
  "customer_id" => customer3.id,
  "film_id" => film3.id,
  "film_time" => "21:00"
  })
ticket3.save()

ticket4 = Ticket.new({
  "customer_id" => customer4.id,
  "film_id" => film3.id,
  "film_time" => "21:00"
  })
ticket4.save()

ticket5 = Ticket.new({
  "customer_id" => customer5.id,
  "film_id" => film3.id,
  "film_time" => "21:00"
  })
ticket5.save()

ticket6 = Ticket.new({
  "customer_id" => customer5.id,
  "film_id" => film3.id,
  "film_time" => "21:00"
  })
ticket6.save()

ticket7 = Ticket.new({
  "customer_id" => customer5.id,
  "film_id" => film3.id,
  "film_time" => "18:00"
  })
ticket7.save()

ticket8 = Ticket.new({
  "customer_id" => customer5.id,
  "film_id" => film3.id,
  "film_time" => "18:00"
  })
ticket8.save()

ticket9 = Ticket.new({
  "customer_id" => customer5.id,
  "film_id" => film3.id,
  "film_time" => "18:00"
  })
ticket9.save()

ticket10 = Ticket.new({
  "customer_id" => customer2.id,
  "film_id" => film2.id,
  "film_time" => "20:00"
  })
ticket10.save()

ticket11 = Ticket.new({
  "customer_id" => customer3.id,
  "film_id" => film2.id,
  "film_time" => "17:00"
  })
ticket11.save()













customer1.funds = 100.00
customer1.update()

film1.price = 1.00
film1.update()


customer1.buy_ticket(film2)


binding.pry
nil