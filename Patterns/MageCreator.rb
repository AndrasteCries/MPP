require_relative 'Mage'
require_relative 'CharacterCreator'
class MageCreator < CharacterCreator
  def create_character
    Mage.new
  end
end