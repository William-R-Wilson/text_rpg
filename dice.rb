module Dice
  def Dice.dsix
	rand(6)+1
  end

  def Dice.dten
	rand(10)
  end

  def Dice.dten_to_ten
  	rand(10)+1
  end

  def Dice.percentile
  	(Dice.dten*10)+Dice.dten_to_ten
  end

  def Dice.dtwenty
    rand(20)+1
  end

  def Dice.deight
    rand(8)+1
  end

end

