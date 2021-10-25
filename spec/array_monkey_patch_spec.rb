require "rspec"
require "array_monkey_patch"

describe Array do
    

    describe "#my_uniq" do
        let(:my_array) { [5,1,-8,3,3, 1,5, 7,8] }
        it "returns a new array" do
            expect(my_array.my_uniq).to_not eql(my_array)
        end
        it "returns a unique array" do
            expect(my_array.my_uniq).to eq(my_array.uniq)
        end
    end

    describe "#two_sum" do
        let(:my_array) { [5,1,-8,3,-3, -3, -1,5,-7, 7,8] }
        let(:one_zero) { [1,0,-1,4]}
        let(:two_zeros) {[1,0,4,0]}
        it "returns an array" do 
            expect(my_array.two_sum).to be_an(Array)
        end

        it "returns all pairs summing to zero" do
            expect(my_array.two_sum).to eq([[1,6],[2,10],[3,4],[3,5],[8,9]])
        end

        it "does not return a single zero" do
            expect(one_zero.two_sum).to eq([[0,2]])
        end

        it "returns pairs of zeros" do
            expect(two_zeros.two_sum).to eq([[1,3]])
        end

    end

    describe "#my_transpose" do
        let(:two_d_array) {[[0,1,2], [3,4,5], [6,7,8]] }
        let(:transposed_array) {[[0,3,6],[1,4,7],[2,5,8]]}
        it "transposes the array" do
            expect(two_d_array.my_transpose).to eq(transposed_array)
        end
    end

    describe "#stock_picker" do
        it "returns a two days (buy day and sell day)" do
            expect([5,2,4,3,7,6,1].stock_picker.length).to eq(2)
        end

        it "picks best days for simple pair" do
            expect([1,0,2,3].stock_picker).to eq([1,3])
        end

        it "picks better pair after encountering possible buy-sell day" do
            expect([5,2,4,3,6,1,6].stock_picker).to eq([5,6])
        end

        it "does not buy if no potential profit" do
            expect([10,8,4,2,1].stock_picker).to be_nil
        end

    end 
end