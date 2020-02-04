class FantasyNBA::API 

  def get_player(name) 
    doc = HTTParty.get("https://www.fantasybasketballnerd.com/service/players") 
    players = doc["FantasyBasketballNerd"]["Player"]
    
    players.detect do |nba_player|
       nba_player["name"] == name 
    end
  end 

end