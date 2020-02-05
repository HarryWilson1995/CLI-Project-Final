class FantasyNBA::FantasyCLI 

  def run 
    welcome 
    menu 
  end 

  def welcome 
    puts "Welcome to every NBA Fantasy basketball player's dream app!" 
  end 

  def menu 
    puts " "
    puts "To learn about an NBA player - type 'player'."
    sleep 1
    puts "To learn about an NBA team - type 'team'."
    sleep 1
    puts "To learn about a player's fantasy rankings - type 'fantasy ranking'."
    sleep 1
    puts "To close the application - type 'exit' at any time."
    sleep 1
    puts "You can return to this menu at any time by typing 'main menu'."
    first_options
  end 

  def first_options 
    @options_input = gets.chomp 

    if @options_input.downcase == "player"
      puts " "
      puts "You have selected 'player'."
      player_selection
    elsif @options_input.downcase == "team"
      puts " "
      puts "You have selected 'team'."
      team_selection  
    elsif @options_input.downcase == "fantasy ranking"
      puts " "
      puts "You have selected 'fantasy ranking'."
      fantasy_selection 
    elsif @options_input.downcase == "exit"
      closing_message
      # return 
    elsif @options_input.downcase == "main menu" 
      menu 
    else 
      puts "Please enter a valid input from the options given to you!"
      menu 
    end
  end 

 
  def player_selection 
    sleep 1
    puts "Which NBA player would you like to learn more about?"
    @player_input = gets.chomp 
    if @player_input.downcase == "exit"
      closing_message
    elsif @player_input.downcase == "main menu"
      menu 
    else 
    @player_generator = FantasyNBA::API.new.get_player(@player_input) 
      if @player_generator != nil && @player_generator["playerId"]
      @player = FantasyNBA::Player.new(@player_generator)
      player_selection_result
      else 
      puts "Please make sure you are typing your player's name correctly and that your player currently plays in the NBA."
      player_selection
     end
    end 
    
  end 

  def team_selection  
    sleep 1
    puts "Which NBA team would you like to learn more about?"
    @team_input = gets.chomp 
    if @team_input.downcase == "exit"
      closing_message
    elsif @team_input.downcase == "main menu"
      menu 
    else 
    @team_generator = FantasyNBA::API.new.get_team(@team_input) 
      if @team_generator != nil && @team_generator["code"]
      @team = FantasyNBA::Team.new(@team_generator)
      team_selection_result
      else 
      puts "Please make sure you are typing your teams's name correctly and that your team plays in the NBA."
      team_selection
     end
    end 
    
  end 

  def fantasy_selection 
    sleep 1
    puts "Which NBA player's fantasy rankings would you like to learn more about?"
    @fantasy_input = gets.chomp 
    if @fantasy_input.downcase == "exit"
      closing_message
    elsif @fantasy_input.downcase == "main menu"
      menu 
    else 
    @fantasy_generator = FantasyNBA::API.new.get_ranking(@fantasy_input) 
      if @fantasy_generator != nil 
      @fantasy = FantasyNBA::PlayerRank.new(@fantasy_generator)
      fantasy_selection_result
      else 
      puts "Please make sure you are typing your player's name correctly and that your player currently plays in the NBA."
      fantasy_selection
     end
    end 
    
  end 

  def player_selection_result 
    puts " "
    puts "You have selected #{@player.name}. #{@player.name} currently plays #{@player.position} for #{@player.team}."
    player_info_options
  end 

  def player_info_options 
    puts " "
    sleep 1 
    puts "To learn where #{@player.name} played his college basketball - type 'college'."
    sleep 1 
    puts "To learn how tall #{@player.name} is - type 'height'."
    sleep 1 
    puts "To learn how much #{@player.name} weighs - type 'weight'."
    sleep 1 
    puts "You can still exit at any point by typing 'exit' or return to the main menu by typing 'main menu'."
    @player_details_input = gets.chomp 
    player_info_output 
  end 

  def team_selection_result 
    puts " "
    puts "You have selected the #{@team.name}. The #{@team.name} play(s) in the #{@team.conference} conference."
    team_info_options
  end 

  def team_info_options 
    puts " "
    sleep 1 
    puts "To learn the three digit code for the #{@team.name} - type 'code'."
    sleep 1 
    puts "To learn which division the #{@team.name} play(s) in - type 'division'."
    sleep 1 
    puts "You can still exit at any point by typing 'exit' or return to the main menu by typing 'main menu'."
    @team_details_input = gets.chomp 
    team_info_output
  end 

  def fantasy_selection_result 
    puts " "
    puts "You have selected #{@fantasy.name}. #{@fantasy.name} currently plays #{@fantasy.position} for #{@fantasy.team}."
    fantasy_info_options
  end 

  def fantasy_info_options 
    puts " "
    sleep 1 
    puts "To learn where #{@fantasy.name} ranks for his position - type 'position'."
    sleep 1 
    puts "To learn where #{@fantasy.name} ranks overall in fantasy basketball - type 'overall'."
    sleep 1 
    puts "You can still exit at any point by typing 'exit' or return to the main menu by typing 'main menu'."
    @fantasy_details_input = gets.chomp 
    fantasy_info_output
  end 

  def player_info_output 
    if @player_details_input.downcase == "exit"
      closing_message
    elsif @player_details_input.downcase == "main menu"
      menu 
    elsif (@player_details_input.downcase == "college" && @player.school != "—") && (@player_details_input.downcase == "college" && @player.school != "No College")
      puts " "
      puts "#{@player.name} went to #{@player.school}."
      player_info_options
    elsif  (@player_details_input.downcase == "college" && @player.school == "—") || (@player_details_input.downcase == "college" && @player.school == "No College")
      puts " "
      puts "#{@player.name} did not play college basketball."
      player_info_options
    elsif @player_details_input.downcase == "height"
      puts " "
      puts "#{@player.name} is #{@player.height}."
      player_info_options
    elsif @player_details_input.downcase == "weight"
      puts " "
      puts "#{@player.name} weighs #{@player.weight}lbs."
      player_info_options
    else 
      puts " "
      puts "Please enter a valid input from the options given to you!"
      player_selection_result
    end 
  end 

  def team_info_output 
    if @team_details_input.downcase == "exit"
      closing_message
    elsif @team_details_input.downcase == "main menu"
      menu 
    elsif @team_details_input.downcase == "code"
      puts " "
      puts "The 3 digit team code for the #{@team.name} is #{@team.code}."
      team_info_options
    elsif @team_details_input.downcase == "division" 
      puts " "
      puts "The #{@team.name} play(s) in the #{@team.division} division."
      team_info_options
    else 
      puts " "
      puts "Please enter a valid input from the options given to you!"
      team_selection_result
    end
  end 

  def fantasy_info_output 
    if @fantasy_details_input.downcase == "exit"
      closing_message
    elsif @fantasy_details_input.downcase == "main menu"
      menu 
    elsif @fantasy_details_input.downcase == "position"
      puts " "
      puts "#{@fantasy.name} ranks number #{@fantasy.rankPos} amongst #{@fantasy.position}'s in the NBA."
      fantasy_info_options
    elsif @fantasy_details_input.downcase == "overall"
      puts " "
      puts "#{@fantasy.name} ranks number #{@fantasy.rankOverall} overall in NBA fantasy basketball."
      fantasy_info_options
    else 
      puts " "
      puts "Please enter a valid input from the options given to you!"
      fantasy_selection_result
    end
  end 

  def closing_message
    puts " "
    puts "Thank you for using every NBA Fantasy basketball player's dream app! See you again soon!"
    sleep 1.5 
  end 

end