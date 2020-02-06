class FantasyNBA::FantasyCLI 

  def run 
    welcome 
    menu 
  end 

  def welcome 
    puts "Welcome to every NBA Fantasy basketball player's dream app!" 
  end 

  def menu 
    sleep 1 
    puts " "
    puts "To learn about an NBA player - type 'player'."
    puts "To learn about an NBA team - type 'team'."
    exit_menu
    first_options
  end 

  def first_options 
    options_input = gets.chomp 

    exit_menu?(options_input)
    if options_input.downcase == "player"
      puts " "
      puts "You have selected 'player'."
      player_selection
    elsif options_input.downcase == "team"
      puts " "
      puts "You have selected 'team'."
      team_selection  
    else 
      invalid_input
      menu 
    end
  end 

 
  def player_selection 
    puts "Which NBA player would you like to learn more about?"
    player_input = gets.chomp 
    exit_menu?(player_input)
    if FantasyNBA::Player.find_by_name(player_input)
      @player = FantasyNBA::Player.find_by_name(player_input)
      player_selection_result
    else 
      player_generator = FantasyNBA::API.new.get_player 
      player_generator.each do |player|
        FantasyNBA::Player.new(player)
      end
      if FantasyNBA::Player.find_by_name(player_input)
      @player = FantasyNBA::Player.find_by_name(player_input)
      player_selection_result
      else 
      invalid_input
      player_selection
     end
    end 
  end 

  def team_selection 
    puts "Which NBA team would you like to learn more about?"
    team_input = gets.chomp 
    exit_menu?(team_input)
    if FantasyNBA::Team.find_by_name(team_input)
      @team = FantasyNBA::Team.find_by_name(team_input)
      team_selection_result
    else 
      team_generator = FantasyNBA::API.new.get_team
      team_generator.each do |team| 
        FantasyNBA::Team.new(team)
      end
      if FantasyNBA::Team.find_by_name(team_input)
      @team = FantasyNBA::Team.find_by_name(team_input)
      team_selection_result
      else  
      invalid_input
      team_selection
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
    puts "To learn where #{@player.name} played his college basketball - type 'college'."
    puts "To learn how tall #{@player.name} is - type 'height'."
    puts "To learn how much #{@player.name} weighs - type 'weight'."
    puts "To learn where #{@player.name} ranks for his position - type 'position rank'."
    puts "To learn where #{@player.name} ranks overall in fantasy basketball - type 'overall rank'."
    exit_menu
    player_details_input = gets.chomp 
    player_info_output(player_details_input)
  end 

  def team_selection_result 
    puts " "
    puts "You have selected the #{@team.name}. The #{@team.name} play(s) in the #{@team.conference} conference."
    team_info_options
  end 

  def team_info_options 
    puts " "
    puts "To learn the three digit code for the #{@team.name} - type 'code'."
    puts "To learn which division the #{@team.name} play(s) in - type 'division'."
    exit_menu
    team_details_input = gets.chomp 
    team_info_output(team_details_input)
  end 

  def player_info_output(player_details_input)
    exit_menu?(player_details_input)
    if (player_details_input.downcase == "college" && @player.school != "—") && (player_details_input.downcase == "college" && @player.school != "No College")
      puts " "
      puts "#{@player.name} went to #{@player.school}."
      player_info_options
    elsif  (player_details_input.downcase == "college" && @player.school == "—") || (player_details_input.downcase == "college" && @player.school == "No College")
      puts " "
      puts "#{@player.name} did not play college basketball."
      player_info_options
    elsif player_details_input.downcase == "height"
      puts " "
      puts "#{@player.name} is #{@player.height}."
      player_info_options
    elsif player_details_input.downcase == "weight"
      puts " "
      puts "#{@player.name} weighs #{@player.weight}lbs."
      player_info_options
    elsif player_details_input.downcase == "position rank"
      if @player.rankPos != nil 
        puts " "
        puts "#{@player.name} ranks number #{@player.rankPos} amongst #{@player.position}'s in the NBA."
        player_info_options
      else 
      fantasy_generator = FantasyNBA::API.new.get_ranking(@player.name)
      @player.rankPos = fantasy_generator["rankPos"]
      puts " "
      puts "#{@player.name} ranks number #{@player.rankPos} amongst #{@player.position}'s in the NBA."
      player_info_options
      end 
    elsif player_details_input.downcase == "overall rank"
      if @player.rankOverall != nil 
        puts " "
        puts "#{@player.name} ranks number #{@player.rankOverall} overall in NBA fantasy basketball."
        player_info_options
      else 
      fantasy_generator = FantasyNBA::API.new.get_ranking(@player.name)
      @player.rankOverall = fantasy_generator["rankOverall"]
      puts " "
      puts "#{@player.name} ranks number #{@player.rankOverall} overall in NBA fantasy basketball."
      player_info_options
      end 
    else 
      invalid_input
      player_selection_result
    end 
  end 

  def team_info_output(team_details_input)
    exit_menu?(team_details_input)
    if team_details_input.downcase == "code"
      puts " "
      puts "The 3 digit team code for the #{@team.name} is #{@team.code}."
      team_info_options
    elsif team_details_input.downcase == "division" 
      puts " "
      puts "The #{@team.name} play(s) in the #{@team.division} division."
      team_info_options
    else 
      invalid_input
      team_selection_result
    end
  end 

  def closing_message
    puts " "
    puts "Thank you for using every NBA Fantasy basketball player's dream app! See you again soon!"
    abort 
  end 

  def invalid_input 
    puts " "
    puts "Please make sure you are spelling everything correctly and try again!"
  end

  def exit_menu?(input)
    if input.downcase == "exit"
      closing_message
    elsif input.downcase == "main menu"
      menu 
    end
  end

  def exit_menu 
    puts "To close the application - type 'exit' at any time."
    puts "You can return to this menu at any time by typing 'main menu'."
  end

end