def input_students
  puts "Please enter the name of your students"
  puts "Just hit enter twice when finished"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "And their favourite hobby".center(60)
    hobby = gets.chomp
    students << {name: name, cohort: :June, hobby: hobby}
    puts "We now have #{students.count} students".center(60)
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Bela Fleck's Banjo Academy".center(60)
  puts "---------------".center(60)
end

def print(students)
  n = 0
  while n < students.length
    puts "#{n+1}. #{students[n][:name]} (#{students[n][:cohort]} cohort)".center(60)
    puts "Favourite hobby: #{students[n][:hobby]}".center(60)
    n += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} excellent students".center(60)
end

students = input_students
print_header
print(students)
print_footer(students)
