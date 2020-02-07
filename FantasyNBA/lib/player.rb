class FantasyNBA::Player 

  extend Findable 

  attr_accessor :name, :team, :position, :height, :weight, :school, :rankPos, :rankOverall

  @@all = []

  def initialize(player_hash)
    player_hash.each do |key, value|
      begin
        self.send("#{key}=", value)
      rescue NoMethodError
      end 
    end
    @@all << self 
  end

  def self.all 
    @@all 
  end
  
end