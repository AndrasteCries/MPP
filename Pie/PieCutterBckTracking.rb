$true_answer = []

def array_has_same_elements(arr)
  first_element = arr[0]
  return arr.all? { |element| element == first_element }
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

def find_dividers(n)
  return (1..n).select { |a| n % a == 0 }
end

def take_slice(pie, r, c, w, h)
  answer = ""
  for i in (r..h - 1)
    for j in (c..w - 1)
      if pie[i] && pie[i][j] == "x"
        return nil
      elsif pie[i] && pie[i][j]
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
  return slice != nil && slice.count('o') == 1
end

def bck_trckng(pie, sizes, w, h, x, answer)
  pie_size = pie.length()
  if array_has_same_elements(pie)
    $true_answer << answer 
    return false
  end
  
  if sizes.empty?
    return false 
  end

  for q in ((0..sizes.length() - 1))
    hn = sizes[q]
    wn = sizes[-q - 1]
    next if wn > w || hn > h
    
    pie_copy = Marshal.load(Marshal.dump(pie))
    answer_copy = Marshal.load(Marshal.dump(answer))

    for i in (0..pie_size - 1)
      if !(pie_copy[i].include? "x")
        for j in (0..pie[i].length() - 1) 
          str = take_slice(pie_copy, i, j, wn, hn + i)
          if checker(str)
            answer_copy << str
            pie_copy = delete_slice(pie_copy, i, j, wn, hn + i)
            flag = bck_trckng(pie_copy, sizes, w, h, x + 1, answer_copy) 
            if flag
              answer_copy.pop
            end
            break
          else
            break
          end
        end
      else
        if wn <= w - pie_copy[i].count("x")
          if i + hn <= pie_size
            for j in (pie_copy[i].count("x")..pie_copy[i].length() - 1)
              str = take_slice(pie_copy, i, j, wn * 2, hn + i)
              if checker(str)
                answer_copy << str
                pie_copy = delete_slice(pie_copy, i, j, wn * 2, hn + i)
                flag = bck_trckng(pie_copy, sizes, w, h, x + 1, answer_copy) 
                if flag
                  answer_copy.pop
                end
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
  return true
end

# pie = [
#   "......",
#   "..oo..",
#   "..oo..",
#   "......",
# ]

pie = [
  ".o......",
  "......o.",
  "....o...",
  "..o.....",
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
answer = []
bck_trckng(pie, sizes, width, height, 0, answer)
$true_answer.reject! { |row| row.length < 4 }
$true_answer = $true_answer.uniq
puts $true_answer.inspect

one_answre = $true_answer.max_by { |subarray| subarray[0] }

puts one_answre.inspect