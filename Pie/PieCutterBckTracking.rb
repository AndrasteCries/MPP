def get_pie_info(pie)
  n = 0 
  width = pie[0].length()
  height = pie.length()
  pie.each do |row|
    n += row.count("o")
  end
  return n, width, height
end

def find_dividers(n)
  return (1..n).select { |a| n % a == 0 }
end

def take_slice(pie, r, c, w, h)
  answer = ""
  for i in (r..h - 1)
    for j in (c..w - 1)
      if pie[i] && pie[i][j]
        answer += pie[i][j]
      end
    end
    answer += "\n"
  end
  return answer
end


def delete_slice(pie, r, c, w, h)
  for i in (r..h - 1)
    for j in (c..w - 1)
      if pie[i] && pie[i][j]
        pie[i][j] = "x"
      end
    end
  end

  return pie
end

def checker(slice)
  return slice.count('o') == 1
end

def bck_trckng(pie, sizes, w, h, x)
  puts "#{x} lvl backtracking "
  answer = []
  pie_size = pie.length()
  sizes_row_len = (sizes.length()/2).ceil
  for q in ((0..sizes_row_len))
    hn = sizes[q]
    wn = sizes[-q - 1]
    next if wn > w || hn > h
    puts "wn = #{wn}, hn = #{hn}"
    for i in (0..pie_size - 1)
      if !(pie[i].include? "x")
        for j in (0..pie[i].length() - 1) 
          str = take_slice(pie, i, j, wn, hn + i)
          if checker(str)
            answer << str
            puts str
            pie = delete_slice(pie, i, j, wn, hn + i)
            answer << bck_trckng(pie, sizes, w, h, x + 1)
            puts pie
            break
          else
            break
          end
        end
      else
        if wn <= w - pie[i].count("x")
          if i + hn <= pie_size
            for j in (pie[i].count("x")..pie[i].length() - 1)
              str = take_slice(pie, i, j, wn * 2, hn + i)
              if checker(str)
                answer << str
                puts str
                pie = delete_slice(pie, i, j, wn * 2, hn + i)
                answer << bck_trckng(pie, sizes, w, h, x + 1)
                break
              else
                break
              end
            end
          end
          next
        else
          next
        end
      end
      break
    end
  end
  return answer
end

pie = [
  "......",
  "..oo..",
  "..oo..",
  "......",
]

# pie = [
#   ".o.o....",
#   "........",
#   "....o...",
#   "........",
#   ".....o..",
#   "........",
# ]



n, width, height = get_pie_info(pie)
area = width * height
sizes = find_dividers(area/n)
puts sizes
answer = bck_trckng(pie, sizes, width, height, 0)
puts answer