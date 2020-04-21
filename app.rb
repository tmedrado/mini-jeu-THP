require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new("Joao")
player2 = Player.new("Pedro")
puts "À ma droite #{player1.name}"
puts "À ma gauche #{player2.name}"
puts "Voici l'état de chaque joueur :"
puts ""
puts player1.show_state
puts player2.show_state

puts "Passons à la phase d'attaque :"
puts ""
while player1.life_points > 0 && player2.life_points > 0

    if player1.life_points <= 0 || player2.life_points <= 0
        break
    end

    puts "#{player1.name} attaque #{player2.name}"
    player1.attacks(player2)
    puts ""

    if player1.life_points <= 0 || player2.life_points <= 0
        break
    end

    puts "#{player2.name} attaque #{player1.name}"
    player2.attacks(player1)
    
    puts ""
    puts "Voici l'état de chaque joueur :"
    puts player1.show_state
    puts player2.show_state

end




# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.