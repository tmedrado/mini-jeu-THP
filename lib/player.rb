require 'pry'
class Player

    attr_accessor :name, :life_points

    def initialize(name, life_points = 10)
        @life_points = life_points
        @name = name
    end

    def show_state
        puts "#{self.name} a #{self.life_points} points de vie"
    end

    def gets_damage(damage)
        puts "#{self.name} subit #{damage} points de dommage"
        @life_points = @life_points - damage
        if @life_points <= 0
            puts "le joueur #{self.name} a été tué !"
        end
    end

    def compute_damage
        rand(1..6)
    end
    

    def attacks(player2)
        damage = compute_damage
        puts "#{name} lui inflige #{damage} points de dommages"
        player2.gets_damage(damage)
    end

end

class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name, life_points = 100, weapon_level = 1)
        super(name,life_points)
        @weapon_level = 1
        @life_points = 100
    end

    def show_state
        puts "#{self.name} a #{self.life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * weapon_level
    end
    
    def search_weapon
        num = rand(1..6)
        puts "Tu as trouve une arme de niveau #{num}"
        if num > @weapon_level
            puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = num
        else 
            puts "M@*#$... Elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        num = rand(1..6)
        if num == 1
            puts "tu n'as rien trouvé..."
        elsif num >= 2 && num <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            if @life_points + 50 > 100
                @life_points = 100
            else 
                @life_points = @life_points + 50
            end
        else num == 6
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            if @life_points + 80 > 100
                @life_points = 100
            else 
                @life_points = @life_points + 80
            end
        end
    end


end

