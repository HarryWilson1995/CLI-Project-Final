class FantasyNBA::Player 

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

  def self.find_by_name(name)
    self.all.detect do |player|
      player.name == name 
    end
  end


end