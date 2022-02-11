all_reading_array = []
ma_array = []
all_reading_ma = []

File.foreach(File.join(File.dirname(__FILE__), 'data.txt')).with_index do |line, line_num|
    current_reading = line.to_i
    all_reading_array << current_reading
    ma_array << current_reading
    if ma_array.size == 3
        all_reading_ma << ma_array.sum
        ma_array.shift
    end
end

File.open(File.join(File.dirname(__FILE__), 'data_ma.txt'), "w+") do |f|
    all_reading_ma.each { |element| f.puts(element) }
end

last_reading = nil
reading_increase_array = []
reading_decrease_array = []

File.foreach(File.join(File.dirname(__FILE__), 'data_ma.txt')).with_index do |line, line_num|
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