require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(instance)
        self.funding > instance.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "not valid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise "not enough funding"
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        # title_count = Hash.new(0)
        # total_salary = 0
        # @employees.each { |employee| title_count[employee.title] += 1 }

        # title_count.each { |title, count| total_salary += (count * salaries[title]) }

        # total_salary / (employees.length)
        total_salary = 0
        @employees.each { |employee| total_salary += salaries[employee.title] }

        total_salary / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(acquired)
        @funding += acquired.funding
        acquired.salaries.each do |title, salary|
            @salaries[title] = salary if !(@salaries.has_key?(title))
        end
        @employees += acquired.employees
        acquired.close

    end

end
