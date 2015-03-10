#this is the map for my D&D text based game
require "./char_gen.rb"

class Scene
	def enter()
		puts "This scene is not yet configured.  Subclass it and press enter()"
		exit(1)
	end
end

class Engine

	def initialize(scene_map)
		@scene_map = scene_map
	end

	def play()
		current_scene = @scene_map.opening_scene()
		last_scene = @scene_map.next_scene("finished")

		while current_scene != last_scene
			next_scene_name = current_scene.enter()
			current_scene = @scene_map.next_scene(next_scene_name)
		end
		# be sure to print out the last scene
		current_scene.enter()

	end
	#end class Engine
end

class Village < Scene
	def enter()
		puts "This is your home village."
		puts "You grew up here, working the fields and hunting in the forest."
		puts "But now it is time to seek bigger and better things"
		puts "if you don't want to live as a peasant for the rest of your life."
		puts "A river surrounds three sides of the village,"
		puts "and a road to the north is the only way out by land."
		puts "To your west is the inn,"
		puts "To your east is a general store,"
		puts "To your south is your grandfather's home,"
		puts "Which way do you go?"
		puts "Enter 'go south' to pay a visit to your old granddad"
		puts "'go north' to leave this little town"
		puts "'go east' to see what's in the store"
		puts "'go west' to see who's in the inn"
		print ">"

		action = $stdin.gets.chomp.downcase

		if action == "go south"
			puts "You decide to pay a visit to your old granddad"
			return :granddad
		elsif action == "go north"
			return :north_road
		elsif action == "go west"
			return :inn
		elsif action == "go east"
			return :store
		else
			puts "Sorry, I don't understand that.  Please put 'go [direction]'"
			return :village
		end
	end
# end Village class
end

class Granddad < Scene
	def enter()
	  puts "Grandad gives you some chainmail!"
	  puts "Dear old Grandad!"
	  $player.change_ac(5)
	  puts "Your AC is now: #{$player.ac}"
	  return :village
	end
end

class NorthRoad < Scene
	def enter()
		puts "There is a Zombie here!"
	    z = Zombie.new


		until z.alive == false || $player.alive == false
		  puts "#{$player_name} attacks!"
		  $player.attack(z, "zombie")
		  puts "Zombie attacks!"
		  z.attack($player, $player_name)
		end
	return :village
	end
end

class Inn < Scene
	
end

class Store < Scene
	
end

class Map
	@@scenes = {
		village: Village.new(),
		granddad: Granddad.new(),
		north_road: NorthRoad.new(),
		inn: Inn.new(),
		store: Store.new()
	}

	def initialize(start_scene)
		@start_scene = start_scene
	end

	def next_scene(scene_name)
		val = @@scenes[scene_name]
		return val
	end

	def opening_scene()
		return next_scene(@start_scene)
	end
#end Map class
end

#need to refactor code, break down classes
#need to add a method to save character and scene





puts "What name do you choose?"
$player_name = $stdin.gets.chomp.downcase
$player = Character.new($player_name)
puts $player.attributes
puts $player.hp
puts $player.ac

a_map = Map.new(:village)
a_game = Engine.new(a_map)
a_game.play()


