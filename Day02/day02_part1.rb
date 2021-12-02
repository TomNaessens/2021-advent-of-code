file = File.open("input")

Instruction = Struct.new(:command, :amount)

instructions = file.readlines.map(&:chomp).map do |line|
  command, amount = line.split
  Instruction.new(command, amount.to_i)
end

Position = Struct.new(:horizontal, :depth)
position = Position.new(0, 0)

instructions.each do |instruction|
  case instruction.command
  when 'forward'
    position.horizontal += instruction.amount
  when 'down'
    position.depth += instruction.amount
  when 'up'
    position.depth -= instruction.amount
  else
    raise NotImplementedError
  end
end

puts position.horizontal * position.depth
