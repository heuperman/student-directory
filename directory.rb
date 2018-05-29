students = [
  "Derroll Adams",
  "Louis 'Lou' Black",
  "Dock Boggs",
  "Jimmy Driftwood",
  "Bee Ho Gray",
  "Papa Charlie Jackson",
  "Cosmo Jarvis",
  "Narvin Kimball",
  "Vess Ossman",
  "Peggy Seeger",
  "Fred Van Eps",
  "Henry Saint Clair 'Taj Mahal' Fredericks"
]

def print_header
  puts "The students of Bela Fleck's Banjo Academy"
  puts "---------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} excellent students"
end

print_header
print(students)
print_footer(students)
