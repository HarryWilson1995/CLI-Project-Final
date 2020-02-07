class FantasyNBA::Team 

  extend Findable 

  attr_accessor :code, :name, :conference, :division 

  @@all = []

  def initialize(team_hash)
    team_hash.each do |key, value|
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