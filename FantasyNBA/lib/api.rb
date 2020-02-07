class FantasyNBA::API 

  BASE = "https://www.fantasybasketballnerd.com/service/"

  def get_player
    doc = HTTParty.get(BASE + "players") 
    players = doc["FantasyBasketballNerd"]["Player"]
  end 

  def get_team
    doc = HTTParty.get(BASE + "teams")
    teams = doc["FantasyBasketballNerd"]["Team"]
  end

  def get_ranking(name)
    doc = HTTParty.get(BASE + "draft-rankings")
    player_ranking = doc["FantasyBasketballNerd"]["Player"]
   
    player_ranking.detect do |nba_player|
      nba_player["name"] == name 
    end
  end

end