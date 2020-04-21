require_relative 'player'

class Game
    attr_accessor :human_player, :enemies
    def initialize(human_player, enemies = [Player.new("enemy0"), Player.new("enemy1"), Player.new("enemy2"), Player.new("enemy3")])
        @enemies = enemies
        @human_player = HumanPlayer.new(human_player)
    end

    def kill_player(player)
        
        player.length.times do |i|
            if player[i].life_points <= 0
                player.delete_at(i)
            end
        end
    end

    def is_still_going?
        if @human_player.life_points > 0 && enemies.length > 0
            return True
        end
    end

    def show_players
        puts "You have #{human_player.life_points} points of life"
        puts "There are #{enemies.length} enemies left"
    end

    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts ""
        puts "Ou attaquer un joueur en vue :"
        
        enemies.length.times do |i|
            if enemies[i].life_points >= 0
                puts "#{i} - #{enemies[i].name} a #{enemies[i].life_points} points de vie"
            end

        end
        puts ""    
    end
    
    def enemies_attacks
        enemies.length.times do |i|
            if @enemies[i].life_points > 0
                @enemies[i].attacks(@human_player)
    
            end
        end
    end
    
    def menu_choice(answer)
        if answer == "a"
            @human_player.search_weapon
        elsif answer == "s"
            @human_player.search_health_pack

        else
            @human_player.attacks(enemies[answer.to_i])    
        end

    end

    def end_game
        if enemies.length = 0
            puts "CONGRATS! YOU`VE KILLED THEM ALL"
        else
            puts "You FAILED! Try again later..."
        end
    end 
        
end


