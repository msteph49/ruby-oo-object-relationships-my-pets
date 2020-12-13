require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species
  
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def species
    @species
  end
  def say_species
    # binding.pry
    "I am a #{@species}."
  end
  def self.all
    @@all
  end
  def self.count
    count = 0
    @@all.count{|name| name}
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.find_all do |cat|
      cat.owner == self
    end
  end
  def dogs
    Dog.all.find_all do |dog|
      dog.owner == self
    end
  end
  def buy_cat(name)
    Cat.new(name, self) #Cat.new is creating new instance
                        # Needs input of name and owner
  end
  def buy_dog(name)
    Dog.new(name, self) #Cat.new is creating new instance
                        # Needs input of name and owner
  end
  def walk_dogs
    self.dogs.map do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    self.cats.map do |cat|
      cat.mood = "happy"
    end
  end
  def sell_pets
    pets = self.dogs + self.cats
    pets.map do |pets|
      pets.mood = "nervous"
      pets.owner = nil
    end
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end