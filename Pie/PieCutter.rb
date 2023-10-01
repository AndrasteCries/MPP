def checker(pie)
  pie.each do |row|
    if row.count("o") != 1
      puts "wrong answer"
      return false
    end
  end 
  puts "correct answer"
  return true
end

def get_pie_info(pie)
  n = 0 
  width = pie[0].length()
  height = pie.length()
  pie.each do |row|
    n += row.count("o")
  end
  return n, width, height
end

def easy_horizontal_way_to_cut(pie, n, height)
  answer = []
  str = ""
  k = 0
  stopper = height / n
  pie.each do |row|
    str = str + "\n" + row
    k += 1
    if k == stopper
      k = 0
      answer.append(str)
      str = ""
    end 
  end
  answer
end

def easy_vertical_way_to_cut(pie, n, width)
  answer = []
  colnum = width / n
  str = ""
  (0...n).each do |c|
    pie.each do |row|
      str += row[c * colnum, colnum] + "\n"
    end
    answer.append(str)
    str = ""
  end
  answer
end


answer = []
pie = [
  "oooooooo",
  "........",
  "........",
  "........",
]

n, width, height = get_pie_info(pie)
puts "Pie info:\n - count'o': #{n};\n - w: #{width};\n - h: #{height}"

if width * height % n == 0
  if height >= n
    horizontal = easy_horizontal_way_to_cut(pie, n, height)
    puts "Easy horisontal result: #{horizontal}"
    if checker(horizontal)
      answer.append(horizontal)
    end
  end
  vertical = easy_vertical_way_to_cut(pie, n, width)
  if checker(vertical)
    answer.append(vertical)
  end
  puts "Easy vertical result: #{vertical}"
else 
  puts "Hard way"
end

puts "Answer: #{answer}"