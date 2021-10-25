require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do 
    subject(:game) { TowersOfHanoi.new }
    describe "#initialize" do
        it "sets up three piles, with all disks in first pile" do
            expect(game.towers).to eq([[1,2,3,4], [], []])
        end
    end

    
    describe "#move" do
        it "moves only one disc at a time" do
            game.move(0,1)
            expect(game.towers[0].length).to eq(3)
        end

        it "moves only the top disc" do 
            game.move(0,1)
            expect(game.towers[0]).to eq([2,3,4])
        end

        it "raises error if move tries to place larger disk on top of a smaller one" do 
            game.move(0,1)
            expect {game.move(0,1)}.to raise_error("Cannot place a disk on top of a smaller one")
        end

        it "raises error if user tries to move from an empty stack" do
            expect {game.move(2,1)}.to raise_error("No disk to move from this stack!")
        end
    end

    describe "won?" do 
        it "cannot win at the start of the game" do 
            expect(game).not_to be_won
        end

        it "game is won when all disks are in last stack" do
            game.move(0,1) #1
            game.move(0,2) #2
            game.move(1,2) #1
            game.move(0,1) #3
            game.move(2,0) #1
            game.move(2,1) #2
            game.move(0,1) #1
            game.move(0,2) #4
            game.move(1,2) #1
            game.move(1,0) #2
            game.move(2,0) #1
            game.move(1,2) #3
            game.move(0,1) #1
            game.move(0,2) #2
            game.move(1,2) #1

            expect(game).to be_won
        end

        it "game is won when all disks are in middle stack" do
            game.move(0,2) #1
            game.move(0,1) #2
            game.move(2,1) #1
            game.move(0,2) #3
            game.move(1,0) #1
            game.move(1,2) #2
            game.move(0,2) 
            game.move(0,1)
            game.move(2,0)
            game.move(2,1)
            game.move(0,2)
            game.move(1,0)
            game.move(2,0)
            game.move(2,1)
            game.move(0,2)
            game.move(0,1)
            game.move(2,1)
            
            expect(game).to be_won
        end


    end
end
