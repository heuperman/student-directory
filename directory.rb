def input_students
  puts "Please enter the name of your students"
  puts "Just hit enter twice when finished"
  students = []
  name = gets.delete("\n")
  while !name.empty? do
    puts "What is #{name}'s favourite hobby?".center(60)
    hobby = gets.chomp
    puts "What is #{name}'s country of origin?".center(60)
    origin = gets.chomp
    students << {name: name, cohort: :June, hobby: hobby, origin: origin}
    # check if there is more than one student and pluralise if so.
    if students.length > 1
      puts "We now have #{students.count} students".center(60)
    else
      puts "We now have #{students.count} student".center(60)
    end
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
    puts "Country of origin: #{students[n][:origin]}".center(60)
    n += 1
  end
end

def print_footer(students)
  if students.count > 1
    puts "Overall, we have #{students.count} excellent students".center(60)
  else
    puts "Overall, we have #{students.count} excellent student".center(60)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
