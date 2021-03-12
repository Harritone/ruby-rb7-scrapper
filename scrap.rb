require 'nokogiri'
require 'httparty'

url = 'https://rb7.ru/afisha/movie-shows'

doc = HTTParty.get(url)

parsed = Nokogiri::HTML(doc.body)

table = parsed.css('table.afisha-schedule')
rows = table.css('tr')
odd = rows.css('tr.odd')
even = rows.css('tr.even')
even_past = rows.css('tr.even.past') || []
odd_past = rows.css('tr.odd.past') || []


counter = {}
result = []

# This isn't the most elegant soulution, but it'll gonna do the trick with counter hash when we don't have key yet.
def nil.+(value)
  value
end

def result.add(*args)
  args.flatten.each { |row| self << row.css('td.film').text.strip }
end

result.add( odd, even, even_past, odd_past)

result.each do |title|
  counter[title] += 1
end

top = counter.sort_by { |_key, value| value }.reverse.take(3)


puts ''
puts "Top 3 movies by amount of the sessions:"
puts ''
top.each_with_index do |value, i|
  puts "#{i+1}. #{value[0]} - #{value[1]} sessions."
end
puts ''