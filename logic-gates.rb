# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
m = gets.to_i

inputs = []
n.times do
  input_name, input_signal = gets.split(" ")
  inputs.push({ input_name: input_name, input_signal: input_signal })
end
# p inputs
[{:input_name=>"A", :input_signal=>"__---___---___---___---___"},
{:input_name=>"B", :input_signal=>"____---___---___---___---_"}]

outputs = []
m.times do
  output_name, type, input_name_1, input_name_2 = gets.split(" ")
  outputs.push({ output_name: output_name, type: type, input_name_1: input_name_1, input_name_2: input_name_2 })
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."
end
# p outputs
# [{:output_name=>"C", :type=>"AND", :input_name_1=>"A", :input_name_2=>"B"},
# {:output_name=>"D", :type=>"OR", :input_name_1=>"A", :input_name_2=>"B"},
# {:output_name=>"E", :type=>"XOR", :input_name_1=>"A", :input_name_2=>"B"}]

# Comparison Method

def signals_compare(signal1, signal2, gate)
  out_signal = ""
  for i in (0..signal1.length - 1)
    case gate
    when "AND"
      signal1[i] == "-" && signal2[i] == "-" ? out_signal += "-" : out_signal += "_"
    when "OR"
      signal1[i] == "-" || signal2[i] == "-" ? out_signal += "-" : out_signal += "_"
    when "XOR"
      (signal1[i] == "-" && signal2[i] == "_") || (signal1[i] == "_" && signal2[i] == "-") ? out_signal += "-" : out_signal += "_"
    when "NAND"
      (signal1[i] == "-" && signal2[i] == "-") ? out_signal += "_" : out_signal += "-"
    when "NOR"
      (signal1[i] == "_" && signal2[i] == "_") ? out_signal += "-" : out_signal += "_"
    when "NXOR"
      (signal1[i] == "-" && signal2[i] == "-") || (signal1[i] == "_" && signal2[i] == "_") ? out_signal += "-" : out_signal += "_"
    else
      "WRONG GATE"
    end
  end
  return out_signal
end

# Parcourir outputs
outputs.each do |output|
  # Pour chaque output, commencer la string avec l'ouput name
  output_name = output[:output_name]
  # p result =>  C / D / E
  # Récupérer les 2 inputs
  input_1 = inputs.find { |input| input.values.include?(output[:input_name_1]) }
  input_2 = inputs.find { |input| input.values.include?(output[:input_name_2]) }
  # p input_1 => {:input_name=>"A", :input_signal=>"__---___---___---___---___"}
  # p input_2 => {:input_name=>"B", :input_signal=>"____---___---___---___---_"}
  # Convertir chaque signal en array de true / false
  # 2e string avec la comparaison entre les signaux 1 et 2
  out_signal = signals_compare(input_1[:input_signal], input_2[:input_signal], output[:type])
  puts output_name + " " + out_signal
end
