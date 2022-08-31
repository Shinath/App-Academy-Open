require 'employee'

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def >(other)
    @funding > other.funding
  end

  def hire(name, title)
    if valid_title?(title) 
      @employees << Employee.new(name, title)
    else
      raise
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    if @funding >= @salaries[employee.title]
      employee.pay(@salaries[employee.title])
      @funding -= salaries[employee.title]
    else
      raise
    end
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    sum = 0
    @employees.each do |employee|
      sum += @salaries[employee.title]
    end
    sum / (@employees.length * 1.0)
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other)
    @funding += other.funding

    other.salaries.each_pair do |title, salary|
      @salaries[title] = salary unless valid_title?(title)
    end

    @employees += other.employees

    other.close
  end
end
