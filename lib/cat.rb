class Cat
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end
  def self.all
    @@all
  end
  def owner_name
    self.owner
  end
  def cats
    Cat.all.find_all do |cat|
      cat.owner == self
    end
  end
  
end