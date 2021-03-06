oxygen_generator_rating = ""
co2_scrubber_rating = ""
(1..2).each do |the_loop|
  counter_1_array = []
  counter_0_array = []
  12.times do
    counter_1_array << 0
    counter_0_array << 0
  end

  File.foreach(File.join(File.dirname(__FILE__), "data.txt")).with_index do |line, line_num|
    puts "#{line_num}: #{line}"
    case line[0].to_i
    when 1
      counter_1_array[0] += 1
    when 0
      counter_0_array[0] += 1
    end
  end

  case the_loop
  when 1
    keep_value = 0
    keep_value = 1 if counter_1_array[0] >= counter_0_array[0]
  when 2
    keep_value = 1
    keep_value = 0 if counter_1_array[0] >= counter_0_array[0]
  end

  File.open(File.join(File.dirname(__FILE__), "0.txt"), "w+") do |f|
    File.foreach(File.join(File.dirname(__FILE__), "data.txt")).with_index do |line, line_num|
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
    case the_loop
    when 1
      keep_value = 0
      keep_value = 1 if counter_1_array[i] >= counter_0_array[i]
    when 2
      keep_value = 1
      keep_value = 0 if counter_1_array[i] >= counter_0_array[i]
    end
    File.open(File.join(File.dirname(__FILE__), "#{i}.txt"), "w+") do |f|
      File.foreach(File.join(File.dirname(__FILE__), "#{i - 1}.txt")).with_index do |line, line_num|
        case line[i].to_i
        when keep_value
          f.puts line

          case the_loop
          when 1
            oxygen_generator_rating = line.chop
          when 2
            co2_scrubber_rating = line.chop
          end

          if i < 11
            case line[i + 1].to_i
            when 1
              counter_1_array[i + 1] += 1
            when 0
              counter_0_array[i + 1] += 1
            end
          end
        end
      end
    end
  end
end
puts "oxygen_generator_rating: #{oxygen_generator_rating}, co2_scrubber_rating: #{co2_scrubber_rating}, life support rating: #{oxygen_generator_rating.to_i(2) * co2_scrubber_rating.to_i(2)}"
