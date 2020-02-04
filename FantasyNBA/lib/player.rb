class FantasyNBA::Player 

  attr_accessor :name, :team, :position, :height, :weight, :school  

  def initialize(player_hash)
    player_hash.each do |key, value|
        self.send("#{key}=", value)
      end 
    end
  end


end