class TowersOfHanoi
    attr_accessor :towers
    def initialize
        @towers = [[1,2,3,4], [], []]
    end  

    def play
        self.render
        until won? 
            from, to = get_moves
            move(from, to)
            self.render
        end
        puts "You won!"
    end

    def get_moves
        puts "Enter the pile number you want to move from"
        from = Integer(gets.chomp) - 1
        puts "Enter the pile number you want to move to"
        to = Integer(gets.chomp) - 1
        [from, to]
    end

    def move(from=0,to=1)
        if @towers[from].empty?
            raise "No disk to move from this stack!"   
        elsif @towers[to][0] && @towers[from][0] > @towers[to][0]
            raise "Cannot place a disk on top of a smaller one"   
        end
        @towers[to].unshift(@towers[from].shift)
    end

    def won?
        @towers[0].empty? && (@towers[1].empty? || @towers[2].empty? )
    end

    def render
        lengths = []
        @towers.each {|row| lengths << row.length}
        duped = self.dup_tower
        puts ["Tower 1","Tower 2","Tower 3"].join(" ")
        (1..lengths.max).to_a.reverse.each do |i|
            duped.each do |row|
                if row.length >= i #&& row[lengths.max - i]
                    disk = ""
                    
                    (row.shift.times { disk << "-"} )
                    print disk.center(8, " ")
                else
                    print "|".center(8, " ")
                end
            end
            puts
        end
    end

    def dup_tower
        dup_rows = []
        @towers.each do |row|
            dup_rows << row.dup
        end
        dup_rows
    end
end

if __FILE__ == $PROGRAM_NAME
    game = TowersOfHanoi.new
    game.play

end