last_reading = nil
reading_increase_array = []
reading_decrease_array = []

File.foreach(File.join(File.dirname(__FILE__), 'data.txt')).with_index do |line, line_num|
  puts "#{line_num}: #{line}"
  current_reading = line.to_i
  unless last_reading.nil?
    reading_increase_array << line_num.to_i if current_reading > last_reading
    reading_decrease_array << line_num.to_i if current_reading < last_reading
  end
  last_reading = current_reading
end

puts "increased: #{reading_increase_array.size}"
puts "decreased: #{reading_decrease_array.size}"