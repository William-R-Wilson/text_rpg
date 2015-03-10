module Combat

	def find_target_thaco
		target_thaco = 20 - target.ac
	end


	def attack(target, target_name)
  	attack_dmg = rand(self.dmg_range)+1
  	
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