@students = []

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
    process(gets.chomp)
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
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the name of your students"
  puts "Just hit enter twice when finished"
  name = gets.delete("\n")
  while !name.empty? do
    puts "What cohort is #{name} in?".center(60)
    cohort = gets.chomp.to_sym
    student = Hash.new("unknown")
    months = [:Jan, :Feb, :March, :April, :May, :June, :July, :Aug, :Sept, :Oct, :Nov, :Dec]
    until months.include?(cohort)
      puts "please input a month".center(60)
      cohort = gets.chomp.to_sym
    end
    if !cohort.empty?
      student[:cohort] = cohort
    end
    student[:name] = name
    @students << student

    # check if there is more than one student and pluralise if so.
    if @students.length > 1
      puts "We now have #{@students.count} students".center(60)
    else
      puts "We now have #{@students.count} student".center(60)
    end
    name = gets.chomp
  end
  @students
end

def print_header
  puts "The students of Bela Fleck's Banjo Academy".center(60)
  puts "---------------".center(60)
end

def print_students_list
  puts "Which cohort would you like to see?".center(60)
  cohort = gets.chomp.to_sym
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

interactive_menu
