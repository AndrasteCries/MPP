numbers = ARGV.map(&:to_i)
ARGV.clear
puts "1. sort"
puts "2. reverse sort"
choice = gets.chomp.to_i

case choice
when 1
    puts  "#{numbers.sort}"
when 2
    puts "#{numbers.sort.reverse}"
else
  puts "Enter 1 or 2 next time"
  exit
end
