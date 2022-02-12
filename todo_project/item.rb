require 'date'
require_relative 'list.rb'

class Item

    attr_accessor :title, :deadline, :description

    def self.valid_date?(date)
        year = date[0..3]
        month = date[5..6]
        day = date[8..9]

        numstr = year + month + day
        numstr.each_char { |n| return false if !("0".."9").to_a.include?(n) }
        

        return false if month.to_i > 12
        return false if day.to_i > 31
        return false if year.to_i < 2000

        true            
    end

    def initialize(title, deadline, description=nil)
        @title = title
        @deadline = Date.strptime(deadline, '%Y-%m-%d')
        @description = description
    end

        

end