class FantasyNBA::PlayerRank 

    attr_accessor :name, :team, :position, :rankPos, :rankOverall

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