require_relative 'list.rb'
require_relative 'item.rb'

class Todoboard 

    attr_reader :label

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "Commands:"
        p "mktodo <title> <deadline> <optional description>"
        p "up <index> <optional amount>"
        # print 
        # print "Commands:"
        # print "Commands:"
        # print "Commands:"
        # print "Choose a command:"
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        
        case cmd
        when 'mktodo'
            self..add_item(*args)
        when 'up'
            up(*args)
        else
            print "Sorry, that command doesn't exist fool"
            return false
        end

        true
    end
end