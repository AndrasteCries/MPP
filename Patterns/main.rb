require_relative 'WarriorCreator'
require_relative 'MageCreator'
require_relative 'RogueCreator'


puts "Enter class (Warrior, Mage, Rogue):"
player_spec = gets.chomp

case player_spec
when "Warrior"
  warrior = WarriorCreator.new
  man = warrior.create_character
  man.attack
when "Mage"
  mage = MageCreator.new.create_character
  mage.attack
when "Rogue"
  rogue = RogueCreator.new.create_character
  rogue.attack
else
  puts "Invalid value"
end