class Room
	attr_reader(:description, :exits, :related_rooms, :actions)
	def initialize(description, exits, actions)
		@description = description
		@exits = exits
		@related_rooms = {}
		@actions = actions
	end

	def add_related_rooms(related_rooms)
		directions = related_rooms.keys
		directions.each do |direction|
			if @exits.include?(direction)
				@related_rooms[direction] = related_rooms[direction]
			end
		end
	end
end

class Game
	def initialize(rooms)
		@rooms = rooms
		@current_room = rooms[0]
		@playing = true
	end

	def print_room_description
		puts @current_room.description
		action_or_exit
	end

	def action_or_exit
		puts "Move or do something?"
		chosen_action = gets.chomp
		if chosen_action == "Move"
			choose_exit
		elsif chosen_action == "Do something"
			choose_action
		end
	end

	def choose_exit
		puts "In which direction do you want to move?"
		puts "Available Exits: #{@current_room.exits}"
		move = gets.chomp
		while !@current_room.exits.include?(move)
			puts "Wrong movement, try again"
			print_room_description
			move = gets.chomp
		end
		@current_room = @current_room.related_rooms[move]
	end

	def choose_action
		puts "What would you do?"
		puts "Available Actions: #{@current_room.actions}"
	end

#	def check_movement(move)
#		while !@current_room.exits.include?(move)
#			puts "Wrong movement, try again"
#			move = gets.chomp
#		end
#		@current_room = @current_room.related_rooms[move]
#		print_room_description

#	end

	def turn_movement
		while @playing
			print_room_description
			action_or_exit
		end
	end
end

room_1 = Room.new("You are in a dark room. There is a door to the north.", ["S"], ["Switch on Light"]) #=> "You discover you are in the kitchen and decide to take a break"})
room_2 = Room.new("You are in the hall. There is an exit door.", ["N", "E"], ["Cry"]) #=> "Poor you"})
room_3 = Room.new("You are in the forest. There is a lot of light. There is a bear sleeping.", ["W"], ["Cry", "Sing"])#=> "The bear wakes up and kills you", "Sing" => "The bear wakes up and kills you"})
room_1.add_related_rooms({"S" => room_2})
room_2.add_related_rooms({"N" => room_1, "E" => room_3})
room_3.add_related_rooms({"W" => room_2})

rooms = [room_1, room_2, room_3]
game = Game.new(rooms)
game.turn_movement
