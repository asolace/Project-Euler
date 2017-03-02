# Names scores
# Problem 22
#
# Using names.txt (right click and 'Save Link/Target As...'), 
# a 46K text file containing over five-thousand first names, 
# begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, 
# multiply this value by its alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, 
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
# So, COLIN would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?

file = File.open("./files/names.txt", "r")
names = file.read

AlphabetValues = ("A".."Z").to_a

# Setting up names array; sort and filter
names = names.split("\",\"")
			 .map! { |char| char.gsub(/\W/, "")} # Eliminates all non-word characters
			 .sort!

# Convert each name to the sum of their letters
names.map! do |name| 
	name.chars.map { |c| c = AlphabetValues.index(c) + 1 }
		.reduce(:+)
end

# Sum of index and nameSum
names.map!.with_index do |name, i|
	name *= i + 1
end


p names.reduce(:+)