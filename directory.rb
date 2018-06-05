@students = []

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} names from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "Invalid input, please try again"
  end
end

def print_menu
  puts "1. Input student names"
  puts "2. Show list of students"
  puts "3. Save the list to students.csv"
  puts "4. Load list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def add_student_to_list(line)
  name, cohort = line.chomp.split(',')
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    add_student_to_list(line)
  end
  file.close
end

def input_students
  puts "Please enter the name of your students and their cohort, seprated by a comma"
  puts "Just hit enter twice when finished"
  line = STDIN.gets.chomp
  until line.empty? do
    add_student_to_list(line)
    # check if there is more than one student and pluralise if so.
    if @students.length > 1
      puts "We now have #{@students.count} students".center(60)
    else
      puts "We now have #{@students.count} student".center(60)
    end
    line = gets.chomp
  end
  @students
end

def print_header
  puts "The students of Bela Fleck's Banjo Academy".center(60)
  puts "---------------".center(60)
end

def print_students_list
  puts "Which cohort would you like to see?".center(60)
  cohort = STDIN.gets.chomp.to_sym
  n = 0
  @students.each do |student|
    if student[:cohort] == cohort
      puts "#{n+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
      n += 1
    end
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} excellent students".center(60)
  else
    puts "Overall, we have #{@students.count} excellent student".center(60)
  end
end

try_load_students
interactive_menu
