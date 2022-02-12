class Board

    attr_reader :max_height

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(n)
        Array.new(n) { Array.new(0) }
    end

    def initialize(n, max_height)
        raise "rows and cols must be >= 4" if n < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(n)
    end

    def add(tok, i)
        if @stacks[i].length < @max_height
            @stacks[i] << tok
            return true
        else
            return false
        end
    end

    def vertical_winner?(tok)
        @stacks.any? { |stack| stack.length == @max_height && stack.last == tok }
    end

    def horizontal_winner?(tok)
        min_l = @stacks.map(&:length).min

        (0...min_l).each do |i|
            uniq = []
            @stacks.each do |stack|
                uniq << stack[i]
                if uniq.length == min_l && uniq.uniq == [tok]
                    return true
                end
            end
        end
        false
    end

    def winner?(tok)
        horizontal_winner?(tok) || vertical_winner?(tok)
    end

end
