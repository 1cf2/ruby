counter_1_array = []
counter_0_array = []
binary_string_gamma = ''
binary_string_epsilon = ''

12.times do
    counter_1_array << 0
    counter_0_array << 0
end

File.foreach(File.join(File.dirname(__FILE__), 'data.txt')).with_index do |line, line_num|
    puts "#{line_num}: #{line}"
    (0..11).each do |i|
        case line[i].to_i
        when 1
            counter_1_array[i] += 1
        when 0
            counter_0_array[i] += 1
        end
    end
end

(0..11).each do |i|
    if counter_1_array[i] > counter_0_array[i]
        binary_string_gamma += '1'
        binary_string_epsilon += '0'
    else
        binary_string_gamma += '0'
        binary_string_epsilon += '1'
    end
end

gamma = binary_string_gamma.to_i(2)
epsilon = binary_string_epsilon.to_i(2)
puts "gamma: #{gamma}, epsilon: #{epsilon}, power consumption: #{gamma * epsilon}"
