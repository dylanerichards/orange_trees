class Orange
end

class OrangeTree
  attr_reader :age, :height, :oranges

  LIFESPAN = 15
  FRUIT_BEARING_AGE = 3

  def initialize
    @age = 0
    @height = 0
    @oranges = []
  end

  def age!
    increase_age_by_one_year unless dead?
    increase_height_by_two_feet unless dead?
    add_three_oranges_to_tree if reached_age?(FRUIT_BEARING_AGE)
  end

  def dead?
    reached_age?(LIFESPAN)
  end

  private

  def reached_age?(requirement)
    age >= requirement
  end

  def increase_age_by_one_year
    @age += 1
  end

  def increase_height_by_two_feet
    @height += 2
  end

  def add_three_oranges_to_tree
    3.times { oranges << Orange.new }
  end
end

class Array
  def pick!
    pop
  end
end
