def test(die)
  test_arr = []
  100000.times do
  	a = dten
    test_arr.push(a)
  end
  one = 0
  two = 0
  three = 0
  four = 0
  five = 0
  six = 0
  seven = 0
  eight = 0
  nine = 0
  zero = 0

  test_arr.each do |i|
  	if i == 1
  		one += 1
  	elsif i == 2
  		two += 1
  	elsif i == 3
  		three += 1
  	elsif i == 4
  		four += 1
  	elsif i == 5
  		five += 1
  	elsif i == 6
  		six += 1
  	elsif i == 7
  		seven += 1
  	elsif i == 8
  		eight += 1
  	elsif i == 9
  		nine += 1
  	elsif i == 0
  		zero += 0
  	else 
  		puts "error"
  		break
  	end
  end
  puts "Number of ones:  #{one}"
  puts "Number of twos:  #{two}"
  puts "Number of threes:  #{three}"
  puts "Number of fours:  #{four}"
  puts "Number of fives:  #{five}"
  puts "Number of sixes:  #{six}"
  puts "Number of sevens:  #{seven}"
  puts "Number of eights:  #{eight}"
  puts "Number of nines:  #{nine}"
  puts "Number of zeros:  #{zero}"
  puts "for a total of #{one+two+three+four+five+six+seven+eight+nine+ zero} rolls"
end

test(dten)