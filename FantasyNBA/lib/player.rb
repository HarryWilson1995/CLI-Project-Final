class FantasyNBA::Player 

  attr_accessor :name, :team, :position, :height, :weight, :school  

  def initialize(player_hash)
    player_hash.each do |key, value|
      begin
        self.send("#{key}=", value)
      rescue 
      end 
    end
  end


end