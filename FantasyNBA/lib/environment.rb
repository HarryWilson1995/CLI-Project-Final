require_relative "./FantasyNBA/version"
require "pry"
require "httparty"

require_relative "./api"
require_relative "./player"
require_relative "./team"
require_relative "./FantasyCLI"


module FantasyNBA
  class Error < StandardError; end
  
end

module Findable 
  def all 
    @@all 
  end

  def find_by_name(name)
    self.all.detect do |object|
      object.name == name 
    end
  end
end
