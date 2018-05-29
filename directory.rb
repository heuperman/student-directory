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

def starting_letter
  puts "Choose a letter to show all stundents starting with this letter"
  gets.chomp
end

def print_header
  puts "The students of Bela Fleck's Banjo Academy"
  puts "---------------"
end

def print(students, starting_letter)
  students.each_with_index do |student, index|
    if student[:name][0] == starting_letter
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} excellent students"
end

students = input_students
print_header
print(students, starting_letter)
print_footer(students)
