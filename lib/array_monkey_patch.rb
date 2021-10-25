class Array

    def my_uniq
        new_array = []
        self.each do |ele|
            next if new_array.include?(ele)
            new_array << ele
        end
        new_array
    end

    def two_sum
        sums = []
        (0...self.length-1).each do |i|
            (i+1...self.length).each do |j|
                next if self[i] + self[j] != 0
                sums << [i,j]
            end
        end
        sums
    end

    def my_transpose
        transposed = Array.new(self.length) {Array.new}
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                transposed[i][j] = self[j][i]
            end
        end
        transposed
    end

    def stock_picker
        buy = nil
        sell = nil
        profit = 0
        (0...self.length-1).each do |i|
            (i...self.length).each do |j|
                new_profit = self[j] - self[i]
                if new_profit > profit
                    buy = i
                    sell = j
                    profit = new_profit
                end
            end
        end

        return [buy, sell] if buy
        nil
    end

end