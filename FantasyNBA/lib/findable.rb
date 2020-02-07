module Findable 

  def find_by_name(name)
    self.all.detect do |object|
      object.name == name 
    end
  end
  
end