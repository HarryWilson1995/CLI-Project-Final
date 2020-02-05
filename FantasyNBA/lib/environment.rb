require_relative "./FantasyNBA/version"
require "pry"
require "httparty"

require_relative "./api"
require_relative "./player_rank"
require_relative "./player"
require_relative "./team"
require_relative "./FantasyCLI"


module FantasyNBA
  class Error < StandardError; end
  
end
