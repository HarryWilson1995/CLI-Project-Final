class FantasyNBA::PlayerRank 

    attr_accessor :name, :team, :position, :rankPos, :rankOverall

    def initialize(player_hash)
      player_hash.each do |key, value|
        begin
          self.send("#{key}=", value)
        rescue 
        end 
      end
    end

  end 