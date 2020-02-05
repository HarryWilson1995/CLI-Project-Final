class FantasyNBA::Team 

  attr_accessor :code, :name, :conference, :division 

  @@all = []

  def initialize(team_hash)
    team_hash.each do |key, value|
      begin
        self.send("#{key}=", value)
      rescue 
      end 
    end
    @@all << self 
  end

  def self.all 
    @@all 
  end

  def self.find_by_name(name)
    self.all.detect do |team|
      team.name == name 
    end
  end
  

end