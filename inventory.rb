# Inventory problem: create an inventory where a user can change the quantity of an item,
# can print a table of all the items and their number, and has a script of possible actions.
# Then work in the ability to add and remove items from the inventory.

# method to validate choice of action:
def validate (action)
	if action == "change" || action == "print" || action == 'add'
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
corn_num = 5
peas_num = 10
okra_num = 6

inventory = {
	"corn" => corn_num, 
	"peas" => peas_num,
	"okra" => okra_num
}

# Ask what the manager wants to do: change an item's number or print entire inventory
puts
puts
puts "Welcome to the Inventory Management System."
puts "As inventory manager, you can 
change the quantity of an item or 
add a new item to inventory, or
print the entire inventory."
puts
puts "What do you want to do?  'change', 'add', or 'print'?"
action = gets.chomp.downcase
validate(action)

if action == "change"
	print "Here is the current list of inventory items: "
	inventory.each do |k,v|
		print "#{k}, "
	end
	puts 
	print "What item's quantity needs to change? "
	item = gets.chomp.downcase
	check_presence(item)
	print "Input the change in quantity: "
	item_quantity = gets.chomp
	inventory["#{item}"] = inventory["#{item}"] + item_quantity.to_i
	new_item_total = inventory["#{item}"]
	puts
	puts "Total #{item} in stock is now: #{new_item_total}."

elsif action == "add"
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

elsif action == "print"
	puts
	puts "Here is the current inventory:"
	inventory.each do |item, num|
		puts "#{item}: #{num} in stock."
	end
end
puts
puts #inventory

# to do list:
# use external data file to make permanent changes
# add option to repeat or exit
# add check_presence method
# add formating (i.e., indent some of the text)
# DRY out the code if possible.
