class FantasyNBA::Player 

  attr_accessor :name, :team, :position, :height, :weight, :school 

  @@all = []

  def initialize(player_hash)
    player_hash.each do |key, value|
      begin
        self.send("#{key}=", value)
      rescue 
      end 
    end
    @@all << self 
  end


end