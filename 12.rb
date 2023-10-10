def roman_converter(input)
    roman_numerals = {
      'I' => 1,
      'IV' => 4,
      'V' => 5,
      'IX' => 9,
      'X' => 10,
      'XL' => 40,
      'L' => 50,
      'XC' => 90,
      'C' => 100,
      'CD' => 400,
      'D' => 500,
      'CM' => 900,
      'M' => 1000
    }
  
    if input.is_a?(String)
      result = 0
      i = 0
      while i < input.length
        if i < input.length - 1 && roman_numerals.key?(input[i, 2])
          result += roman_numerals[input[i, 2]]
          i += 2
        else
          result += roman_numerals[input[i]]
          i += 1
        end
      end
      result
    elsif input.is_a?(Integer)
      result = ''
      roman_numerals.keys.reverse_each do |numeral|
        while input >= roman_numerals[numeral]
          result += numeral
          input -= roman_numerals[numeral]
        end
      end
      result
    else
      puts 'Неправильний тип вводу. Введіть римську цифру у вигляді рядка або ціле число.'
      return nil
    end
  end
  
  # Тестуємо функції
  puts roman_converter('MCMXC')  # Виведе 1990
  puts roman_converter('MMVIII') # Виведе 2008
  puts roman_converter('MDCLXVI') # Виведе 1666
  
  puts roman_converter(4) # Виведе "IV"
  