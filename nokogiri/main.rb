require 'nokogiri'
require 'open-uri'
require 'csv'

main_link = 'https://www.hospitalsafetygrade.org/all-hospitals'
write_data = []

doc = Nokogiri::HTML(URI.open(main_link))
doc.css('#BlinkDBContent_849210 > ul > li > a').each do |link, i = write_data.length|
  location_document = Nokogiri::HTML(URI.open(link["href"]))
  data = Array.new
  data << i
  data << link.content.strip  # Добавляем имя госпиталя

  location = location_document.css("#SearchResults > div.resultsList > div > div.detailWrapper > div.address")
  puts location
  if location
    address_text = location.text.strip
    address_lines = address_text.split("\n")
    address = address_lines[0..1].join(" ")
    data << address
  else
    puts "parse error" 
    data << "Address not found"
  end
  write_data << data
  break if i == 20
  sleep(2)
end

CSV.open("myfile2.csv", "w") do |csv|
  csv << ["ID", "Name", "location"]
  write_data.each do |data|
    csv << data
  end
end