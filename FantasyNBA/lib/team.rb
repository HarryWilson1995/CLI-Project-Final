class FantasyNBA::Team 

  extend Findable 

  attr_accessor :code, :name, :conference, :division 

  @@all = []

  def initialize(team_hash)
    team_hash.each do |key, value|
      if self.respond_to?("#{key}=")
        self.send("#{key}=", value)
      end 
    end
    @@all << self 
  end

  def self.all 
    @@all 
  end
  
end