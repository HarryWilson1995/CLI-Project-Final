class FantasyNBA::FantasyCLI 

  def initialize
    puts "Welcome to every NBA Fantasy basketball player's dream app!" 
  end

  def run  
   puts "Would you like to learn about a team, player or a player's fantasy ranking (team, player, fantasy ranking)?"

   input = gets.chomp

  #  Could maybe do a case here for input, player, random player, team, random team ... 

   if input.downcase == "player"
    puts "Which player would you like to learn about?"
    desired_player = gets.chomp
     
    test = FantasyNBA::API.new.get_player(desired_player)

    if test != nil && test["playerId"] 
      player = FantasyNBA::Player.new(test)
    else 
      puts "Please make sure you are spelling your player's name correctly and that he definitely plays in the NBA, then try again!" #make a method out of this or personalize the message. Maybe a module. 
      run 
    end

    puts "#{player.name} currently plays #{player.position} for #{player.team}."

    def further_info

      puts "Is there anything else you would like to know? Type 'school', 'height' or 'weight' to learn more about your player. Otherwise type 'exit' to close the application or type 'new search' to learn about another team or player."

    end 

    further_info

    def closing_message 
      puts "Thank you for using every NBA Fantasy basketball player's dream app! See you again soon!"
    end

    while input != "exit"  
      
      input = gets.chomp 
    
    if (input.downcase == "school" && player.school != "—") && (input.downcase =="school" && player.school != "No College")
      puts "#{player.name} went to #{player.school}."
      further_info
    elsif (input.downcase == "school" && player.school == "—") || (input.downcase == "school" && player.school == "No College") 
      puts "#{player.name} did not play college basketball."
      further_info
    # elsif input.downcase == "school" && player.school == "No College"
    #   puts "#{player.name} did not play college basketball."
    #   further_info
    elsif input.downcase == "height"
      puts "#{player.name} is #{player.height}."
      further_info
    elsif input.downcase == "weight" 
      puts "#{player.name} weighs #{player.weight}lbs."
      further_info
    elsif input.downcase == "new search"
      run
    elsif input.downcase == "exit"
      closing_message
    else 
      puts "Please enter a valid response as listed in the previous question."
      further_info
    end

  end 
  

   elsif input.downcase == "team" 
      puts "Which team would you like to learn about?"
      desired_team = gets.chomp
       
      test = FantasyNBA::API.new.get_team(desired_team)
  
      if test != nil && test["code"] 
        team = FantasyNBA::Team.new(test)
      else 
        puts "Please make sure you are entering a current NBA team and that you are spelling it correctly. Enter your team in the format 'Washington Wizards'" #make a method out of this or personalize the message. Maybe a module. 
        run 
      end
  
      puts "The #{team.name} play(s) in the #{team.conference} conference."

      def further_info

        puts "Is there anything else you would like to know? Type 'code' to learn about your team's 3 digit code or type 'division' to discover which division your team plays in. Otherwise type 'exit' to close the application or type 'new search' to learn about another team or player."
  
      end 

      further_info 

      def closing_message 
        puts "Thank you for using every NBA Fantasy basketball player's dream app! See you again soon!"
      end
  
      while input != "exit"  
        
      input = gets.chomp 
      
      if input.downcase == "code"
        puts "The #{team.name}'s 3 digit team code is #{team.code}."
        further_info
      elsif input.downcase == "division"
        puts "The #{team.name} play(s) in the #{team.division} division."
        further_info
      elsif input.downcase == "new search"
        run
      elsif input.downcase == "exit"
        closing_message
      else 
        puts "Please enter a valid response as listed in the previous question."
        further_info
      end
    end 

  elsif input.downcase == "fantasy ranking"

    puts "Which player would you like to learn about?"
    desired_player_ranking_name = gets.chomp 

    test = FantasyNBA::API.new.get_ranking(desired_player_ranking_name)

    if test != nil 
      player_ranking = FantasyNBA::PlayerRank.new(test)
    else 
      puts "Please make sure you are spelling your player's name correctly and that he definitely plays in the NBA then try again!"
      run 
    end

    puts "#{player_ranking.name} currently plays #{player_ranking.position} for #{player_ranking.team}."

    def rank_request 

      puts "If you would like to learn your player's ranking for his position, enter 'position'. Enter 'overall' to get your player's overall fantasy ranking. Otherwise type 'exit' to close the application of type 'new search' to learn about another team, player, or someone'e fantasy ranking."

    end 

    rank_request

    def closing_message 
      puts "Thank you for using every NBA Fantasy basketball player's dream app! See you again soon!"
    end

    while input != "exit"
    
    input = gets.chomp

    if input.downcase == "position"
      puts "#{player_ranking.name} ranks #{player_ranking.rankPos} amongst #{player_ranking.position}'s."
      rank_request
    elsif input.downcase == "overall"
      puts "#{player_ranking.name} ranks number #{player_ranking.rankOverall} overall in fantasy basketball."
      rank_request
    elsif input.downcase == "new search"
      run 
    elsif input.downcase == "exit"
      closing_message
    else 
      puts "Please enter a valid response as listed in the previous question."
      rank_request
    end
  end 

   else 
    puts "Please enter a valid response!"
      run
   end

   #here I would like to do if player and then bio (already coded in API class), and then needed to look at other pages on API. If team, can look again at pages for that API.
       
     
  end

end