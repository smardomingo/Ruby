class Employee
	attr_reader :name, :email
	def initialize(name, email)
		@name = name
		@email = email
	end
end


class HourlyEmployee < Employee
	def initialize(name, email, hourly_pay, hours_worked)
		@name = name
		@email = email
		@hourly_pay = hourly_pay
		@hours_worked = hours_worked
	end

	def calculate_salary
		salary = @hours_worked * @hourly_pay
	end
end


class SalariedEmployee < Employee
	def initialize(name, email, year_salary)
		@name = name
		@email = email
		@year_salary = year_salary
	end

	def calculate_salary
		salary = @year_salary/48
	end
end


class MultiPaymentEmployee < Employee
	def initialize(name, email, year_salary, hourly_pay, hours_worked)
		@name = name
		@email = email
		@year_salary = year_salary
		@hourly_pay = hourly_pay
		@hours_worked = hours_worked
	end

	def calculate_salary
		fix_salary = @year_salary/14
		if @hours_worked > 40
			extra_hours = @hours_worked - 40
		else
			extra_hours = 0
		end
		salary = (extra_hours * @hourly_pay) + fix_salary
	end
end

class Payroll
	def initialize(employees)
		@employees = employees		
	end
	def notify_employee(employee)
		puts "Email sent to #{employee.email}"		
	end

	def pay_employees
		@employees.each do |employee| 
	      	puts "#{employee.name} salary => #{employee.calculate_salary}"
	    	notify_employee(employee)
	    end
  		bruto = @employees.reduce(0) {|sum, employee| sum + employee.calculate_salary}
  		total = bruto + (bruto * 0.18)
  		puts "Salary total cost => #{total}"
	end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
sara = HourlyEmployee.new('Sara', 'sara@email.com', 15, 50)
juanita = HourlyEmployee.new('Juanita', 'juana@email.com', 15, 80)

employees = [josh, nizar, ted, sara, juanita]
payroll = Payroll.new(employees)
payroll.pay_employees