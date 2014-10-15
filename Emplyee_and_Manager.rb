class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end
  
  def tree_salary
    self.salary
  end
end

class Manager < Employee
  attr_reader :employees
  
  def initialize(*args)
    super
    @employees = []
  end
  
  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
      sum += employee.tree_salary
    end
    sum * multiplier
  end
    
  def tree_salary
    sum = self.employees.inject(0) {|accum, emp| accum + emp.tree_salary} 
    sum += self.salary
  end
  
end

mrman = Employee.new('man', 'mister', 50_000, 'bossman')
mumps = Employee.new('mumps', 'mister', 30_000, 'bossman')
mefuzula = Employee.new('mefuzula', 'mister', 60_000, 'bossman')
theboss = Manager.new('bossman', 'local mister branch manager', 100_000, 'diva')
diva = Manager.new('diva', 'head of mister department', 200_000, 'overlord')
p mrman.bonus(1)
theboss.employees << mrman
theboss.employees << mefuzula
theboss.employees << mumps
p theboss.bonus(2)
diva.employees << theboss
p diva.bonus(2)