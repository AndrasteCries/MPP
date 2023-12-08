def compute_lps_array(pattern)
  length = 0
  i = 1
  lps = [0] * pattern.length

  while i < pattern.length
    if pattern[i] == pattern[length]
      length += 1
      lps[i] = length
      i += 1
    else
      if length != 0
        length = lps[length - 1]
      else
        lps[i] = 0
        i += 1
      end
    end
  end

  lps
end

def kmp_search(text, pattern)
  m = pattern.length
  n = text.length
  lps = compute_lps_array(pattern)
  i = 0
  j = 0

  while i < n
    if pattern[j] == text[i]
      i += 1
      j += 1
    end

    if j == m
      puts "Pattern found at index #{i - j}"
      j = lps[j - 1]
    elsif i < n && pattern[j] != text[i]
      if j != 0
        j = lps[j - 1]
      else
        i += 1
      end
    end
  end
end

# Приклад використання
text = "ABABDABACDABABCABAB"
pattern = "AB"
kmp_search(text, pattern)
