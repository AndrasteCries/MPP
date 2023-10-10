$roman_hash = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}

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
  $roman_hash.each_pair do |roman, value|
    while num[0] == roman
      answer += value
      num.slice!(0)
    end
  end
  answer
end

puts "Enter ur number:"
input = gets.chomp.to_i
puts to_roman(input)
puts to_arabic(to_roman(input))