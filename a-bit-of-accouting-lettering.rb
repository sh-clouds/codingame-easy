input = STDIN.read.split("\n")
number_of_invoices = input[0].to_i
number_of_statements = input[1].to_i

invoices = []
(0...number_of_invoices).each do |i|
  invoices.push(input[i + 2].to_i)
end

statements = []
(0...number_of_statements).each do |i|
  amount = input[i + 2 + number_of_invoices].strip
  statements.push([amount, amount, []])
end

to_check = [statements]

invoices.each do |amount|
  new_check = []

  to_check.each do |statement_group|
    statement_group.each_with_index do |statement, index|
      amount_start, amount_left, list = statement
      if amount_left.to_i >= amount
        updated_statement = Marshal.load(Marshal.dump(statement_group))
        updated_statement[index][1] = (amount_left.to_i - amount).to_s
        updated_statement[index][2].push(amount)

        new_check.push(updated_statement)
      end
    end
  end

  to_check = new_check
end

alphabet = ('A'..'Z').to_a
alphabet.each do |name|
  info = to_check[0].shift

  break if info.nil?
  puts "#{name} #{info[0]} - #{info[2].join(" ")}"
end
