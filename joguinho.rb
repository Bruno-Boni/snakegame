require "ruby2d"

set background: "black"
set title: "Snake Game with Ruby"
set fps_cap: 20
SQUARE_SIZE = 20
SCREEN_WIDTH = Window.width / SQUARE_SIZE
SCREEN_HEIGHT = Window.height / SQUARE_SIZE

class Snake 
    attr_writer :direction
    def initialize 
        @start_positions = [[2,0], [2,1], [2,2], [2,3]]
        @direction = 'down'
    end

    def create 
        @start_positions.each do |position|
            Square.new(x: position[0]*SQUARE_SIZE, y: position[1]*SQUARE_SIZE, size: SQUARE_SIZE-1, color: "white")
        end
    end 

    def move 
        @start_positions.shift
        case @direction
        when "down"
            @start_positions.push([head[0], head[1]+1])
        when "up"
            @start_positions.push([head[0], head[1]-1])
        when "left"
            @start_positions.push([head[0]-1, head[1]])
        when "right"
            @start_positions.push([head[0]+1, head[1]])
        end
    end

    def grow
    end

    private 

    def head 
        @start_positions.last
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
    snake.move
end

#Keyboard keys 
on :key_down do |events|
    if ["left", "right", "up", "down"].include?(events.key)
        snake.direction = events.key 
    end
end







































show