# let's put all the student names in an array
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
# and then print them
puts "The students of Bela Fleck's Banjo Academy"
puts "---------------"
students.each do |student|
  puts student
end
# finally we print the total
puts "Overall, we have #{students.count} excellent students"
