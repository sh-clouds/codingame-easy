# Fonction récursive qui encode un message -n fois (n est négatif)
def encode(message, n)
  return message if n == 0 # Si n == 0, on a fini, on return le resultat

  current_step = 1                # Etape actuel de l'encodage
  output = ""                      # String de sortie
  until message.length.zero?      # Tant que le message a encodé n'est pas vide, on continue
    substring = ""
    if current_step < message.length # Si l'etape actuel a une valeur inférieur a la longueur restante du message
      substring = message[0...current_step]  # On récupére une sous chaine de "etape" charactere depuis l'indice 0
      message = message[current_step..-1]    # Et on enléve cette sous chaine au message d'origine
    else # Sinon on récupére le reste du message a encodé
      substring = message
      message = ""
    end

    if current_step.odd? # Si etape est impair
      output += substring
    else # Sinon on ajoute au debut de l'output la sous chaine "s"
      output = substring + output
    end
    current_step += 1
  end
  encode(output, n + 1)
end

# Fonction qui sera utilisé dans le décodage et qui récupérera le nombre d'etape et la somme de celle ci
# Pour trouvez le nombre de lettre restante a la derniere etape
def find_max_step(n)
  output = [0, 0] # output[0] == etape; output[1] == somme;
  while output[1] < n
    output[0] += 1
    output[1] += output[0]
  end
  output[1] -= output[0]
  output[0] -= 1
  output
end

# Fonction récursive qui decode le message n fois
def decode(message, n)
  return message if n == 0

  max_step = find_max_step(message.length) # maxEtape[0] == etape; maxEtape[1] == somme;
  output = ""                              # String de sortie

  # Ce block permet de géré la derniere etape de l'encodage (et donc la premiere du decodage) qui consiste a
  # ne pas se basé sur l'etape actuel pour le nombre de caractére mais plutot les dernieres restant
  pos = message.length - max_step[1]
  unless pos.zero?
    if max_step[0].even?
      output = message[max_step[1]..-1] + output
      message = message[0...max_step[1]]
    else
      output = message[0...pos] + output
      message = message[pos..-1]
    end
  end

  until message.length.zero? # Tant que le message a encodé n'est pas vide, on continue
    if max_step[0].even? # Si on est a une etape pair on récupére du debut du message
      output = message[0...max_step[0]] + output
      message = message[max_step[0]..-1]
    else # Sinon on récupére de la fin du message
      output = message[-max_step[0]..-1] + output
      message = message[0...-max_step[0]]
    end
    max_step[0] -= 1
  end
  decode(output, n - 1)
end

n = gets.to_i
message = gets.chomp

if n > 0
  puts decode(message, n)
else
  puts encode(message, n)
end
