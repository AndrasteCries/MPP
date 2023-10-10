$roman_hash = {"M" => 1000, 'CM' => 900, "D" => 500, 'CD' => 400, "C" => 100, "XC" => 90, "L" => 50, "XL" => 40, "X" => 10, "IX" => 9, "V" => 5, "IV" => 4, "I" => 1}

def to_roman(num)
  answer = ""
  $roman_hash.each_pair do |roman, value|
    while num >= value
      answer += roman
      num -= value
    end
  end
  answer
end

def to_arabic(num)
  answer = 0
  $roman_hash.keys.sort_by { |k| k.length }.reverse.each do |roman|
    while num.start_with?(roman)
      answer += $roman_hash[roman]
      num = num[roman.length..-1]
    end
  end
  answer
end

puts "Enter ur number:"
input = gets.chomp.to_i
puts to_roman(input)
puts to_arabic(to_roman(input))
