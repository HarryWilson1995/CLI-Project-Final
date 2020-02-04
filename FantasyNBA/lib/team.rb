class FantasyNBA::Team 

  attr_accessor :code, :name, :conference, :division 

  def initialize(team_hash)
    team_hash.each do |key, value|
      begin
        self.send("#{key}=", value)
      rescue 
      end 
    end
  end
  

end