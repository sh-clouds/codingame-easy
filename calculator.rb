n = gets.to_i
first_value = 0 # Premiere valeur de l'opération
second_value = 0 # Seconde valeur de l'opération
display = "" # Affichage
operation = "" # Opération

def update_value(first_value, second_value, operation)
  if operation == "+"
    first_value += second_value
  elsif operation == "-"
    first_value -= second_value
  elsif operation == "x"
    first_value *= second_value
  elsif operation == "/"
    first_value /= second_value
  else
    first_value = second_value
  end
  (first_value * 1000).round / 1000.0
end

def out(f)
  return "%g" % ("%.3f" % f)
end

n.times do
  key = gets.chomp

  # Si l'opération a une longueur de 2, c'est que la touche = a été appuyée
  if operation.length == 2 && key == "="
    operation = operation[0]
  elsif operation.length == 2
    operation = ""
  end

  # Si la key est une opération
  if key == "+" || key == "-" || key == "x" || key == "/"
    # Et que le display n'est pas vide, on effectue l'opération
    if display != ""
      first_value = update_value(first_value, second_value, operation)
    end
    # L'opération prend la valeur de key pressé et affiche la première valeur de l'opération
    operation = key
    display = first_value.to_s
  # Si la key est AC, on reset toutes les variables et mettons display à 0
  elsif key == "AC"
    first_value = 0
    second_value = 0
    operation = ""
    display = "0"
  # Si la key est =
  elsif key == "="
    first_value = update_value(first_value, second_value, operation) # On effectue l'opération
    display = first_value.to_s # On met à jour l'affichage
    operation += "=" # On ajoute un = à l'opération (utilisé dans le cas de multiples appuis sur =)
  # La key est un chiffre, on update l'affichage et change la valeur2 de l'opération
  else
    display += key
    second_value = display.to_i
  end

  
  puts out(display.to_f)


  # Si la key est autre chose qu'un chiffre, après l'affichage du display on le reset
  if key == "+" || key == "-" || key == "x" || key == "/" || key == "AC" || key == "="
    display = ""
  end
end
