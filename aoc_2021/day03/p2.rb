counter_1_array = []
counter_0_array = []
oxygen_generator_rating = ''

12.times do
    counter_1_array << 0
    counter_0_array << 0
end

File.foreach(File.join(File.dirname(__FILE__), 'data.txt')).with_index do |line, line_num|
    puts "#{line_num}: #{line}"
    case line[0].to_i
    when 1
        counter_1_array[0] += 1
    when 0
        counter_0_array[0] += 1
    end
end
keep_value = 0
keep_value = 1 if counter_1_array[0] >= counter_0_array[0]
File.open(File.join(File.dirname(__FILE__), '0.txt'), "w+") do |f|
    File.foreach(File.join(File.dirname(__FILE__), 'data.txt')).with_index do |line, line_num|
        case line[0].to_i
        when keep_value
            f.puts line
            case line[1].to_i
            when 1
                counter_1_array[1] += 1
            when 0
                counter_0_array[1] += 1
            end
        end
    end   
end

(1..11).each do |i|
    keep_value = 0
    keep_value = 1 if counter_1_array[i] >= counter_0_array[i]
    File.open(File.join(File.dirname(__FILE__),"#{i}.txt"), "w+") do |f|
        File.foreach(File.join(File.dirname(__FILE__), "#{i-1}.txt")).with_index do |line, line_num|
            case line[i].to_i
            when keep_value
                f.puts line
                oxygen_generator_rating = line.chop if i == 11
                if i < 11
                    case line[i+1].to_i
                    when 1
                        counter_1_array[i+1] += 1
                    when 0
                        counter_0_array[i+1] += 1
                    end
                end
            end
        end   
    end
end

i = 0