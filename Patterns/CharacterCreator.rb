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
