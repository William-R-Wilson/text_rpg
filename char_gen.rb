


require "./dice.rb"
#Dice module contains the different dice.  Might add methods to roll each a particular number of times

class Being

  def initialize
  	@alive = true
  end 

  attr_accessor :alive

  def attack(target, target_name)
  	attack_dmg = rand(self.dmg_range)+1
  	target_thaco = 20 - target.ac
  	puts "#{target_name} AC is #{target.ac}"
  	puts "#{target_name} has #{target.hp} HP"
  	puts "roll #{target_thaco} or better to hit"
  	attack_roll = Dice.dtwenty
  	puts attack_roll
  	if attack_roll >= target_thaco
  		puts "the attack hits!"
  		puts "#{self.name} does #{attack_dmg} points damage!"
  		target.hp = target.hp - attack_dmg #not sure this will work
  		#would like to set dmg to a different die for each class
  		puts "#{target_name} has #{target.hp} HP left!"
  		if target.hp <= 0
  			puts "#{target_name} is dead!"
  			target.alive = false
  		end
  	else
  		puts "the attack misses!"
  	end
  end

  


end

class Character < Being
	
	def initialize(name)
		@name = name
		puts "Character #{name} created!"
		@attributes = {}
		@attr_bonuses = {}
		roll_attributes
		roll_hp
		find_ac
		@dmg_range = 2 + @attr_bonuses[:str_bonus]
		
	end
	
	attr_accessor :attributes
	attr_accessor :attr_bonuses
	attr_accessor :hp
	attr_accessor :ac
	attr_reader :name
	attr_reader :dmg_range


	def roll_hp
		a = Dice.dten_to_ten 
		b = @attr_bonuses[:con_bonus]
		@hp = a + b
	end

	def find_ac 
		puts "Dex bonus:  #{@attr_bonuses[:dex_bonus]}"
		@ac = 10 - @attr_bonuses[:dex_bonus]
	end

	def change_ac(x)
		@ac = x - @attr_bonuses[:dex_bonus]
	end

 	def attr_roll #4d6 method
	  ar = []
	  4.times do 
	    ar.push(Dice.dsix)
	  end
	  x = ar.sort
	  x.delete_at(0)
      x[0]+x[1]+x[2]
    end




	def roll_attributes
		@attributes[:str] = attr_roll
		@attr_bonuses[:str_bonus] = attr_bonus(@attributes[:str])
		@attributes[:dex] = attr_roll
		@attr_bonuses[:dex_bonus] = attr_bonus(@attributes[:dex])
		@attributes[:int] = attr_roll
		@attr_bonuses[:int_bonus] = attr_bonus(@attributes[:int])
		@attributes[:wis] = attr_roll
		@attr_bonuses[:wis_bonus] = attr_bonus(@attributes[:wis])
		@attributes[:con] = attr_roll
		@attr_bonuses[:con_bonus] = attr_bonus(@attributes[:con])
		@attributes[:cha] = attr_roll
		@attr_bonuses[:cha_bonus] = attr_bonus(@attributes[:cha])

	end
	
	
	def attr_bonus(score)
		if (score < 3 || score > 18) 
			puts "Something's wrong, not a valid range"
		else 
	  		case score
	  		when 3,4
				modifier = -3
	  		when 5,6
				modifier = -2
	  		when 7,8
				modifier = -1
	  		when 13, 14
				modifier = 1
	  		when 15, 16, 17
				modifier = 2
	 		when 18
				modifier = 3
	  		when 9,10,11,12
				modifier = 0
	  		end
		end
	end

#end Character class
end


class Zombie < Being

	def initialize
		@name = "Zombie"
		@ac = 7
		@hp = Dice.deight
		@dmg_range = 6
	end

	def attack_dmg
		Dice.dsix
	end

	attr_reader :name
	attr_accessor :ac
	attr_accessor :hp
	attr_reader :dmg_range

	#end zombie class
end

  
 




#steve = Character.new("Steve")
#puts steve.attributes
#puts steve.attr_bonuses
#puts "HP: #{steve.hp}"
#puts "AC: #{steve.ac}"

#z = Zombie.new


#until z.alive == false || will.alive == false
#	puts "Will attacks!"
#	will.attack(z)
#	puts "Zombie attacks!"
#	z.attack(will)
#end
