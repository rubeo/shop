# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


order=Order.create(order_number: '000003', 
           total_price: 10,
           total_num_of_items: 5,
           max_discount: 0,
           status: "Ordered",         
           role: "Administrator",
           date_of_ordering: Time.now, 
             delivery_date: Time.now,
             pref_delivery_date: Time.now,  
             credit_card_type: "MasterCard")

items = Item.create([{ item_name: "Orange1", item_description: "Orange1", dimension: "Box", price: 10 },
                     {item_name: "Onion1", item_description: "Onion1", dimension: "Box", price: 2 }])


#itemstable = Itemstable.create([{price_per_line: 50, quantity: 1, item_id: items[0].id},
#            {price_per_line: 10, quantity: 1, item_id: items[1].id}])

itemstable1 = Itemstable.create(price_per_line: 50, quantity: 1, item_id: items[0].id)
itemstable2 = Itemstable.create(price_per_line: 20, quantity: 2, item_id: items[1].id)

order.itemstables<<itemstable1
order.itemstables<<itemstable2


