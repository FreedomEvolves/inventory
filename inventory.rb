# Inventory problem: create an inventory where a user can add items, 
# change their quantity, and delete the item.  User can also print the
# entire inventory.
# At each step, user is prompted with valid choices of action.

# method to validate choice of action:
def validate (action)
	if action == "add" || action == "change" || action == 'delete' || action == 'print' || action == 'exit'
		puts "You chose '#{action}.'"
		puts
	else 
		puts "That is not a valid choice!"
		puts
		exit
	end
end

def check_presence(item)
	puts
end

#initialize hash of inventory items
inventory = {}

# Ask what the manager wants to do: change an item's number or print entire inventory
puts
puts
puts "Welcome to the Inventory Management System."
puts "As inventory manager, you can:
add a new item to inventory
delete an item from inventory
change the quantity of an item 
print the entire inventory."
puts
action = nil
until action == "exit"
	puts "What do you want to do?  'change', 'add', 'delete', or 'print'?"
	puts "Type 'exit' when done."
	action = gets.chomp.downcase
	validate(action)

	if action == "add"
		puts "What item do you wish to add to inventory? "
		item = gets.chomp.downcase
		puts "You added #{item}."
		puts
		print "Input the initial quantity: "
		item_quantity = gets.chomp
		inventory["#{item}"] = item_quantity
		new_item_total = inventory["#{item}"]
		puts
		puts "Total #{item} in stock is: #{new_item_total}."

	elsif action == "change"
		print "Here is the current list of inventory items: "
		inventory.each do |k,v|
			print "#{k}, "
		end
		puts 
		print "What item's quantity needs to change? "
		item = gets.chomp.downcase
		#check_presence(item)
		print "Input the change in quantity: "
		item_quantity = gets.chomp
		inventory["#{item}"] = (inventory["#{item}"]).to_i + item_quantity.to_i
		new_item_total = inventory["#{item}"]
		puts
		puts "Total #{item} in stock is now: #{new_item_total}."

	elsif action == "delete"
		print "Here is the current list of inventory items: "
		inventory.each do |k,v|
			print "#{k}, "
		end
		puts 
		print "Delete which item (Caution: this action is irreversible!)? "
		item = gets.chomp.downcase
		inventory.tap { |hs| hs.delete(item) }
		puts "#{item} has been deleted."
		puts

	elsif action == "print"
		puts
		puts "Here is the current inventory:"
		inventory.each do |item, num|
			puts "#{item}: #{num} in stock."
		end
		puts
	end
end

puts #inventory

# to do list:
# use external data file to make permanent changes
# add check_presence method
# add formating (i.e., indent some of the text)
# DRY out the code if possible.
