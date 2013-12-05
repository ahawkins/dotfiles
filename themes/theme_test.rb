require 'logger'

colors = {
  0 => 'Black',
  1 => 'Red',
  2 => 'Green',
  3 => 'Yellow',
  4 => 'Blue',
  5 => 'Magenta',
  6 => 'Cyan',
  7 => 'White'
}

colorizers = colors.to_a.map do |pair|
  number, name = pair

  [
    -> (string) { "\033[3#{number}m #{string} in #{name}\033[0m" },
    -> (string) { "\033[3#{number};1m #{string} in bright #{name}\033[0m" },
  ]
end.flatten

require 'time'

colorizers.each do |colorizer|
  2.times do 
    puts "#{colorizer.call(Time.now.iso8601)}: followed by some long white text"
  end
end
