students = [
  {name: "Derroll Adams", cohort: :June},
  {name: "Louis 'Lou' Black", cohort: :June},
  {name: "Dock Boggs", cohort: :June},
  {name: "Jimmy Driftwood", cohort: :June},
  {name: "Bee Ho Gray", cohort: :June},
  {name: "Papa Charlie Jackson", cohort: :June},
  {name: "Cosmo Jarvis", cohort: :June},
  {name: "Narvin Kimball", cohort: :June},
  {name: "Vess Ossman", cohort: :June},
  {name: "Peggy Seeger", cohort: :June},
  {name: "Fred Van Eps", cohort: :June},
  {name: "Henry Saint Clair 'Taj Mahal' Fredericks", cohort: :June}
]

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

print_header
print(students)
print_footer(students)
