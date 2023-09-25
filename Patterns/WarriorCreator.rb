require_relative 'Warrior'
require_relative 'CharacterCreator'
class WarriorCreator < CharacterCreator
  def create_character
    Warrior.new
  end
end