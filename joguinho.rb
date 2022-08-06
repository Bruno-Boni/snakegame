require "ruby2d"

set background: "black"
set title: "Snake Game with Ruby"
set fps_cap: 20
SQUARE_SIZE = 20
SCREEN_WIDTH = Window.width / SQUARE_SIZE
SCREEN_HEIGHT = Window.height / SQUARE_SIZE

class Snake 
    def initialize 
        @start_positions = [[2,0], [2,1], [2,2], [2,3]]
    end

    def create 
        @start_positions.each do |position|
            Square.new(x: position[0]*SQUARE_SIZE, y: position[1]*SQUARE_SIZE, size: SQUARE_SIZE-1, color: "white")
        end
    end 

    def move 
    end

    def grow
    end

    private 

    def head 
    end 

    def coordinates 
    end
end

class Game 
    def initialize
        @score = 0
    end 

    def record_hit
        @score +=1
    end

    def snake_eat_food 
    end

    def finish_game
    end
end

snake = Snake.new 
game = Game.new

#Snake and Game Actions
update do 
    clear 
    snake.create 
end

#Keyboard keys 
on :key_down do |events|
end







































show