number_of_tests = gets.to_i
number_of_tests.times do |test_index|
    input_info = gets.strip.split

    points = 0

    if input_info[1] != "Pass"
        matches = input_info[1].match(/([1-7])(C|D|H|S|NT)(XX|X|)?/)
        contract, trump, doubled = matches.captures

        difference = input_info[2].to_i - 6 - contract.to_i

        # Contract was won
        if difference >= 0
            if trump == "C" || trump == "D"
                points += 20 * contract.to_i
            elsif trump == "H" || trump == "S"
                points += 30 * contract.to_i
            else
                points += 40 + (30 * (contract.to_i - 1))
            end

            if doubled == "X"
                points *= 2
            elsif doubled == "XX"
                points *= 4
            end

            if points >= 100
                points += input_info[0] == "V" ? 500 : 300
            else
                points += 50
            end

            if contract.to_i == 6
                points += input_info[0] == "V" ? 750 : 500
            elsif contract.to_i == 7
                points += input_info[0] == "V" ? 1500 : 1000
            end

            if difference > 0
                if doubled == "X"
                    points += difference * (input_info[0] == "V" ? 200 : 100)
                elsif doubled == "XX"
                    points += difference * (input_info[0] == "V" ? 400 : 200)
                else
                    points += difference * (trump == "C" || trump == "D" ? 20 : 30)
                end
            end

            if doubled == "X"
                points += 50
            elsif doubled == "XX"
                points += 100
            end
        # Contract was lost
        else
            if doubled == "X" || doubled == "XX"
                if input_info[0] == "V"
                    points = -200
                    points += (difference + 1) * 300
                else
                    points = -100
                    if difference < -1
                        points += [difference + 1, -2].max * 200
                    end
                    if difference < -3
                        points += (difference + 3) * 300
                    end
                end

                if doubled == "XX"
                    points *= 2
                end
            else
                points = difference * (input_info[0] == "V" ? 100 : 50)
            end
        end
    end

    puts points
end