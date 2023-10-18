def ip_address?(str)
    parts = str.split(".")
    return unless parts.length == 4 # до першого false перевіряємо якщо зловили його то повертаемо 
  
    parts.all? { |part| part.match?(/^\d{1,3}$/) part.to_i >= 0 && part.to_i <= 255 && part.to_i.to_s == part } #(/^\d{1,3}$/) - 1-3 елементи в String, перевіряємо рейнж та перевіряємо чи є початковий парт нашим перетвореним

  end
  
  puts ip_address?("192.168.1.1")  # повертає true
  puts ip_address?("010.010.010.010")  # повертає false
  