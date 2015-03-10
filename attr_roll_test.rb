require "./dice.rb"

def attr_roll #4d6 method
	ar = []
	4.times do 
		ar.push(Dice.dsix)
	end
	x = ar.sort
	x.delete_at(0)
    x[0]+x[1]+x[2]
end

attr_roll
