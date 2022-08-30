class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def name
    @name
  end

  def name=(str)
    @name = str
  end

  def breed
    @breed
  end

  def breed=(str)
    @breed = str
  end

  def age
    @age
  end

  def age=(num)
    @age = num
  end

  def bark
    if @age > 3
      @bark.upcase
    else
      @bark.downcase
    end
  end

  def favorite_foods
    @favorite_foods
  end

  def favorite_food?(food)
    return true if @favorite_foods.map(&:downcase).include?(food.downcase)
    false
  end
end
