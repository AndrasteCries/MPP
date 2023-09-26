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
  def create_character(name)
    Warrior.new(name)
  end
end

class MageCreator < CharacterCreator
  def create_character(name)
    Mage.new(name)
  end
end

class RogueCreator < CharacterCreator
  def create_character(name)
    Rogue.new(name)
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

class Warrior < CharacterSpec
  def attack
    puts "#{@name} - Hit sword"
  end
end

class Mage < CharacterSpec
  def attack
    puts "#{@name} - Hit fireball"
  end
end

class Rogue < CharacterSpec
  def attack
    puts "#{@name} - Hit knife"
  end
end

puts "Enter class (Warrior, Mage, Rogue):"
player_spec = gets.chomp
puts "Enter character name:"
player_name = gets.chomp

case player_spec
when "Warrior"
  warrior = WarriorCreator.new.create_character(player_name)
  warrior.attack
when "Mage"
  mage = MageCreator.new.create_character(player_name)
  mage.attack
when "Rogue"
  rogue = RogueCreator.new.create_character(player_name)
  rogue.attack
else
  puts "Invalid value"
end