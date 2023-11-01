def longest_common_subsequence(text1, text2)
    answer = {} #співпадання
    size_text1, size_text2 = text1.length, text2.length #розміри тексту

    for i in 0..size_text1 - 1
        for j in 0..size_text2 - 1
            if text1[i] == text2[j]                                                         
                if i > 0 && j > 0                                                                       #якщо це співпадання і воно не перше інакше
                    answer["#{i},#{j}"] = (answer["#{i - 1},#{j - 1}"].to_i + 1)
                else
                    answer["#{i},#{j}"] = 1
                end
            else                                                                                        #якщо не співпала то беремо останне максимальне співпадання
                answer["#{i},#{j}"] = [answer["#{i},#{j - 1}"].to_i, answer["#{i - 1},#{j}"].to_i].max
            end
        end
    end
    return answer["#{size_text1 - 1},#{size_text2 - 1}"].to_i  #останній елемент в нас завжди є найбільшим співпаданням
end