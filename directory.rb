@students = []
@cohorts = []

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input student names"
  puts "2. Show list of students"
  puts "3. Save the list to a file"
  puts "4. Load list from a file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1" then @students = input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then select_file_to_load
    when "9" then exit
    else puts "Invalid input, please try again"
  end
end

def input_students
  puts "Please enter the name of your students and their cohort, seprated by a comma"
  puts "Just hit enter twice when finished"
  line = STDIN.gets.chomp
  until line.empty? do
    add_student_to_list(line)
    puts "We now have #{@students.count} " +
      (@students.length > 1 ? "students." : "student.")
    line = gets.chomp
  end
  @students
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  puts "Please choose a file name, no extension needed"
  filename = gets.chomp
  File.open("#{filename}.csv", "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Student list saved as '#{filename}.csv'"
end

def select_file_to_load
  puts "Please enter filename to load list from"
  filename = gets.chomp
  load_students(filename)
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      add_student_to_list(line)
    end
  end
  puts "Loaded #{@students.count} names from #{filename}"
end

def add_student_to_list(line)
  name, cohort = line.chomp.split(',')
  @students << {name: name, cohort: cohort.to_sym}
  @cohorts << cohort if !@cohorts.include? cohort
end

def print_header
  puts "The students of Bela Fleck's Banjo Academy"
  puts "---------------"
end

def print_students_list
  display_cohort_list
  cohort = @cohorts[gets.chomp.to_i - 1].to_sym
  print_cohort_students(cohort)
end

def display_cohort_list
  puts "Which cohort would you like to see?"
  @cohorts.each_with_index do |cohort, i|
    puts "#{i + 1}. #{cohort}"
  end
end

def print_cohort_students(cohort)
  n = 0
  @students.each do |student|
    if student[:cohort] == cohort
      puts "#{n + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      n += 1
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} excellent " +
    (@students.count > 1 ? "students." : "student.")
end

try_load_students
interactive_menu
