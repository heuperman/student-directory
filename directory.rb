def input_students
  puts "Please enter the name of your students"
  puts "Just hit enter twice when finished"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :June}
    puts "We now have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Bela Fleck's Banjo Academy"
  puts "---------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} excellent students"
end

students = input_students
print_header
print(students)
print_footer(students)
