require 'rspec'
require "./reversi.rb"

include Reversi

describe Board do
  subject(:board) { Board.new }

  it "is an 8x8 grid" do
    board.grid.count.should be(8)
    8.times {|row| board.grid[row].count.should be(8) }
  end

  it "initializes with two white pieces and two white pieces in the middle" do
    pieces = []
    pieces << board.grid[3][3]
    pieces << board.grid[4][3]
    pieces << board.grid[3][4]
    pieces << board.grid[4][4]
    pieces.should =~ [:black,:black,:white,:white]
  end

  describe "#place_piece" do
    it "places a piece in a coordinate" do
      board.place_piece(:black, [4,2])
      board.grid[4][2].should eq(:black)
    end
  end

  describe "#find_pieces" do
    it "finds all the pieces of one color on the board" do
      board.find_pieces(:black).count.should be(2)
    end

    it "finds pieces after placing a new piece" do
      board.place_piece(:black, [4,2])
      board.find_pieces(:black).count.should be(3)
    end

    it "should return their coordinates" do
      board.find_pieces(:black).should =~ [[3,3],[4,4]]
      board.find_pieces(:white).should =~ [[4,3],[3,4]]
    end
  end

  describe "#off_board?" do
    it "returns true for coordinates that are off the board" do
      board.should be_off_board([8,8])
    end

    it "returns false for coordinates that are on the board" do
      board.should_not be_off_board([1,1])
    end
  end

  describe "#find_moves" do
    it "returns moves for a piece" do
      counter = 0
      board.find_moves([3,3]).each do |move_chain|
        counter +=1 if move_chain.include?([5,3]) || move_chain.include?([3,5])
      end
      counter.should be(2)

    end

    it "doesn't find moves that are off the board" do
      board.find_moves([3,3]).should_not =~ [[8,8],[-1,-1],[8,-1],[-1,8]]
    end
  end

end