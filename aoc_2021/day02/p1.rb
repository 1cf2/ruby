current_move = []
distance = 0
depth = 0

File.foreach(File.join(File.dirname(__FILE__), 'data.txt')).with_index do |line, line_num|
    puts "#{line_num}: #{line}"
    current_move = line.split
    case current_move.first
    when 'forward'
        distance += current_move.last.to_i
    when 'up'
        depth -= current_move.last.to_i
    when 'down'
        depth += current_move.last.to_i
    end
end

puts "distance: #{distance}, depth: #{depth}, size: #{distance * depth}"