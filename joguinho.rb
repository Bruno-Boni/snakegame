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
        @start_positions.push([head[0]+1, head[1]])
    end

    def x 
        head[0]
    end

    def y 
        head[1]
    end

    private 

    def head 
        @start_positions.last
    end 

    def coordin_limitation
    end
end

class Game
    def initialize
        @score = 0
        @x_food = 10 
        @y_food = 3
    end 

    def record_hit
        @score +=1
    end

    def food 
        Square.new(x: @x_food*SQUARE_SIZE, y: @y_food*SQUARE_SIZE, size: SQUARE_SIZE, color: "yellow")
    end

    def change_food_position 
        @x_food = rand(SCREEN_WIDTH)
        @y_food = rand(SCREEN_HEIGHT)
    end 

    def snake_eat_food?(x, y)
        @x_food == x && @y_food == y 
    end

    def finish_game?
    end

    def text_message 
        Text.new("O seu score atual é: #{@score}", color: 'green', x: 10, y: 10, size: 25, z: 1)
    end
end

snake = Snake.new 
game = Game.new

#Snake and Game Actions
update do 
    clear 
    snake.create 
    snake.move

    game.food
    if game.snake_eat_food?(snake.x, snake.y)
        game.change_food_position
        game.record_hit
        snake.grow 
    end
    game.text_message
end

#Keyboard keys 
on :key_down do |events|
    if ["left", "right", "up", "down"].include?(events.key)
        snake.direction = events.key 
    end
end 






































show