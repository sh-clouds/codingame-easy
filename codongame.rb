# Define a constant CODON hash
CODON = {
  "UUU" => "F",
  "CUU" => "L",
  "AUU" => "I",
  "GUU" => "V",
  "UUC" => "F",
  "CUC" => "L",
  "AUC" => "I",
  "GUC" => "V",
  "UUA" => "L",
  "CUA" => "L",
  "AUA" => "I",
  "GUA" => "V",
  "UUG" => "L",
  "CUG" => "L",
  "AUG" => "M",
  "GUG" => "V",
  "UCU" => "S",
  "CCU" => "P",
  "ACU" => "T",
  "GCU" => "A",
  "UCC" => "S",
  "CCC" => "P",
  "ACC" => "T",
  "GCC" => "A",
  "UCA" => "S",
  "CCA" => "P",
  "ACA" => "T",
  "GCA" => "A",
  "UCG" => "S",
  "CCG" => "P",
  "ACG" => "T",
  "GCG" => "A",
  "UAU" => "Y",
  "CAU" => "H",
  "AAU" => "N",
  "GAU" => "D",
  "UAC" => "Y",
  "CAC" => "H",
  "AAC" => "N",
  "GAC" => "D",
  "UAA" => "Stop",
  "CAA" => "Q",
  "AAA" => "K",
  "GAA" => "E",
  "UAG" => "Stop",
  "CAG" => "Q",
  "AAG" => "K",
  "GAG" => "E",
  "UGU" => "C",
  "CGU" => "R",
  "AGU" => "S",
  "GGU" => "G",
  "UGC" => "C",
  "CGC" => "R",
  "AGC" => "S",
  "GGC" => "G",
  "UGA" => "Stop",
  "CGA" => "R",
  "AGA" => "R",
  "GGA" => "G",
  "UGG" => "W",
  "CGG" => "R",
  "AGG" => "R",
  "GGG" => "G"
}

# Read the number of RNA sequences
number_of_sequences = gets.to_i
number_of_sequences.times do
  rna_sequence = gets.chomp

  sequences = []
  (0..2).each do |index|
    current_sequence = ""
    state = 0
    sequences[index] = [0, []]

    # Go through the RNA
    (index..rna_sequence.length - 3).step(3) do |s|
      codon = rna_sequence[s, 3]

      # Starting a new sequence
      state = 1 if codon == "AUG"

      # Ending a sequence
      if CODON[codon] == "Stop" && state == 1
        sequences[index][0] += current_sequence.length
        sequences[index][1] << current_sequence

        current_sequence = ""
        state = 0
      elsif state == 1 # Add into the sequence
        current_sequence += CODON[codon]
      end
    end
  end

  # Sort by number of amino acids
  sequences.sort_by! { |sequence| sequence[0] }

  puts sequences.last[1].join("-")
end