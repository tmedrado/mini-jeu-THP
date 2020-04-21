require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'



player1 = HumanPlayer.new("Joao")
player2 = HumanPlayer.new("Pedro")
puts "*"*56
puts "*    Bienvenue sur 'ILS VEULENT TOUS MA POO' !         *"
puts "*    Le but du jeu est d'être le dernier survivant !   *"
puts "*"*56


puts""
puts""
puts"Write your name:"
result = gets.chomp

enemies = []

user = HumanPlayer.new(result)
enemy1 = Player.new("Jose")
enemies << enemy1
enemy2 = Player.new("Josiane")
enemies << enemy2

puts""
puts  "Les stats de chaq'un:"
user.show_state
enemy1.show_state
enemy2.show_state

puts ""
puts  "On commence le combat!"
puts ""

while user.life_points > 0 && (enemies[0].life_points >0 || enemies[1].life_points >0 )
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "Ou attaquer un joueur en vue :"
    puts "0 - #{enemy1.name} a #{enemy1.life_points} points de vie"
    puts "1 - #{enemy2.name} a #{enemy2.life_points} points de vie"
    puts ""
    action = gets.chomp
    if action == "a"
        user.search_weapon
    elsif action == "s"
        user.search_health_pack
    elsif action == "0"
        user.attacks(enemy1)
    else action == "1"
        user.attacks(enemy2)
    end
    puts ""

    if enemy1.life_points <= 0 && enemy2.life_points <= 0
        break
    end

    puts "Les autres joueurs t'attaquent!"
    if enemy1.life_points > 0 && enemy2.life_points >0
        enemy1.attacks(user)
        enemy2.attacks(user)

    elsif enemy1.life_points <= 0 && enemy2.life_points >0
        enemy2.attacks(user)

    else enemy1.life_points > 0 && enemy2.life_points <= 0
        enemy1.attacks(user)
    end
    puts ""
    user.show_state
    enemy1.show_state
    enemy2.show_state
end

puts  "La partie est finie"
if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu !"
end 



binding.pry