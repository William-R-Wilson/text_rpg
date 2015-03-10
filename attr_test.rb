require "./dice.rb"

def attr_roll
	Dice.dsix + Dice.dsix + Dice.dsix
end

$attributes = {}
$attr_bonuses = {}

def roll_attributes
	$attributes[:str] = attr_roll
	$attr_bonuses[:str_bonus] = attr_bonus($attributes[:str])
	$attributes[:dex] = attr_roll
	$attr_bonuses[:dex_bonus] = attr_bonus($attributes[:dex])
	$attributes[:int] = attr_roll
	$attr_bonuses[:int_bonus] = attr_bonus($attributes[:int])
	$attributes[:wis] = attr_roll
	$attr_bonuses[:wis_bonus] = attr_bonus($attributes[:wis])
	$attributes[:con] = attr_roll
	$attr_bonuses[:con_bonus] = attr_bonus($attributes[:con])
	$attributes[:cha] = attr_roll
	$attr_bonuses[:cha_bonus] = attr_bonus($attributes[:cha])
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


percentile_test = []
100000.times do 
	percentile_test.push(Dice.percentile)
end

puts percentile_test.count(100)
puts percentile_test.count(1)
puts percentile_test.count(50)