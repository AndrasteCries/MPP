#@abstract
class CharacterCreator
  def create_character
    raise NotImplementedError, "not implemented method"
  end
  def generated_character
    character = create_character
    character.generate
    puts "Creator: i'm create this - #{character}"
  end
end

class WarriorCreator < CharacterCreator
  def create_character
    Warrior.new
  end
end

class MageCreator < CharacterCreator
  def create_character
    Mage.new
  end
end

class RogueCreator < CharacterCreator
  def create_character
    Rogue.new
  end
end

#@abstract
class CharacterSpec
  attr_accessor :name
  def initialize(name="NoName")
    @name = name
  end
  def attack
    raise NotImplementedError, "not implemented method"
  end
end
puts "Enter class (Warrior, Mage, Rogue):"
player_spec = gets.chomp

class Warrior < CharacterSpec
  def attack
    puts "Hit sword"
  end
end

class Mage < CharacterSpec
  def attack
    puts "Hit fireball"
  end
end

class Rogue < CharacterSpec
  def attack
    puts "Hit knife"
  end
end

case player_spec
when "Warrior"
  warrior = WarriorCreator.new.create_character
  warrior.attack
when "Mage"
  mage = MageCreator.new.create_character
  mage.attack
when "Rogue"
  rogue = RogueCreator.new.create_character
  rogue.attack
else
  puts "Invalid value"
end