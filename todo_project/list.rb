require_relative 'item.rb'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description=nil)
        if !Item::valid_date?(deadline)
            return false 
        else
            @items << Item.new(title, deadline, description)
            true
        end
    end

    def size
        @items.length
    end

    def valid_index?(i)
        # @items.index(i).nil?
        if i < @items.length
            return true
        end
        false
    end

    def swap(i1, i2)
        return false if !valid_index?(i1) || !valid_index?(i2)
        @items[i1], @items[i2] = @items[i2], @items[i1]
    end

    def [](idx)
        @items[idx]
    end

    def priority
        @items.first
    end

    def print
        p "-".ljust(40, "-")
        p " ".ljust(15) + self.label + " ".ljust(15)
        p "-".ljust(40, "-")
        p "Index" + " | " + "Item".ljust(20) + "| " + "Deadline".ljust(10)

        i = 0
        while i < @items.size
            p "#{i}".ljust(6, " ") + "| " + "#{self[i].title}".ljust(20, " ") + "|" + "#{self[i].deadline}"
            i += 1
        end
        p "-".ljust(40, "-")
    end

    def print_full_item(i)
        p "-".ljust(35, "-")
        p "#{self[i].title}".ljust(25, " ") + "#{self[i].deadline}"
        p "#{self[i].description}"
        p "-".ljust(35, "-")
    end

    def print_priority
        print_full_item(0)
    end

    def []=(i, val)
        @items[i] = val
    end

    def up(i, amt=1)
        if valid_index?(i)
            while i > 0 && amt > 0 # 1 , 1 times
                self[i - 1], self[i] = self[i], self[i - 1]
                amt -= 1
                i -= 1
            end
        else
            return false
        end
        true
    end

    def down(i, amt)
        if valid_index?(i)
            while i < @items.size && amt > 0 # 1 , 1 times
                self[i + 1], self[i] = self[i], self[i + 1]
                amt -= 1
                i += 1
            end
        else
            return false
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end
end