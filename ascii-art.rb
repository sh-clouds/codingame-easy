# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l = gets.to_i
h = gets.to_i
t = gets.chomp.upcase

h.times do
    result = ""
    row = gets.chomp
    # Séparer la ligne ascii en un tableau de caractères ascii
    ascii_row = row.scan(/.{1,#{l}}/)
    # Parcourir la chaine de caractères
    for i in (0..t.length - 1)
        # Récupérer la lettre de la chaîne de caractères
        letter = t[i]
        # Trouver la position de la lettre dans l'alhpabet
        index_alphabet = letter.ord - "A".ord + 1
        # Lui donner la position 0 si c'est un caractère spécial
        index_alphabet = index_alphabet <= 0 ? 0 : index_alphabet
        # Récupérer la ligne de caractères ascii de la lettre, et la concaténer à result
        result += ascii_row[index_alphabet - 1]
    end
    # Afficher la ligne asci
    puts result
end
