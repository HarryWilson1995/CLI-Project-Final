require_relative "./FantasyNBA/version"
require "pry"
require "httparty"

require_relative "./api"
require_relative "./player"
require_relative "./team"
require_relative "./FantasyCLI"
require_relative "./findable"


module FantasyNBA
  class Error < StandardError; end

end
