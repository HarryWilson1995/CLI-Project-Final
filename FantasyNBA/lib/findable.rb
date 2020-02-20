module Findable 

  def find_by_name(name)
    self.all.detect do |object|
      object.name.downcase == name.downcase
    end
  end
  
end