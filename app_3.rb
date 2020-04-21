require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'


puts "Whats your name?"
str = gets.chomp
my_game = Game.new(str)
while TRUE
    my_game.menu
    answer = gets.chomp
    my_game.menu_choice(answer)
    puts ""
    puts "Their time to attack!"
    puts ""


    my_game.enemies_attacks
    puts ""
    puts "#{str} have #{my_game.human_player.life_points} life points"
    puts ""
    
    if my_game.enemies.length == 0 || my_game.human_player.life_points <= 0
        break
    end


end

my_game.end_game