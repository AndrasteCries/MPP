require_relative 'Rogue'
require_relative 'CharacterCreator'
class RogueCreator < CharacterCreator
  def create_character
    Rogue.new
  end
end