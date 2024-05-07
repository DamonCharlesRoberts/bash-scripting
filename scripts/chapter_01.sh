#!/opt/homebrew/bin/bash

# man [x]: provides the manual for that command
# [x] --help: provides details about the command.
# grep: filters input based on regex pattern matching
#   * egrep or grep -e: handles extended patterns
# cat: concatenates file contents
# tail \ head: give the last -n lines
# wc: does a word count (-w) or a line count (-l)
# sed: does pattern-matched string replacement

# Create a file with three lines called fruits.txt
echo banana > ./assets/chapter_1/data/fruits.txt
echo apple >> ./assets/chapter_1/data/fruits.txt
echo carrot >> ./assets/chapter_1/data/fruits.txt
# View the contents of the file.
cat ./assets/chapter_1/data/fruits.txt

# Find all of the contents that have the letter p in it.
echo "Words with p in it: `grep 'p' ./assets/chapter_1/data/fruits.txt`"
# Find all of the contents that have the letter a in it.
echo "Words with a in it: `grep 'a' ./assets/chapter_1/data/fruits.txt`"
# Find the count of each type of fruit
#   * Take the contents of the file, sort it, then count the unique occurances of it.
echo "Count of each type of fruit: $(cat ./assets/chapter_1/data/fruits.txt | sort | uniq -c)"

# Create a file with a few lines that defines the animal and type.
echo "magpie, bird" > ./assets/chapter_1/data/animals.txt
echo "emu, bird" >> ./assets/chapter_1/data/animals.txt
echo "kangaroo, marsupial" >> ./assets/chapter_1/data/animals.txt
echo "wallaby, marsupial" >> ./assets/chapter_1/data/animals.txt
echo "shark, fish" >> ./assets/chapter_1/data/animals.txt

# Find the file of each type.
# Take the contents of the file.
# Pull out the second element when the string is cut by the space. To get the group
# Then sort it alphabetically
# Then count how many there are of each  type.
echo "Count of each type of animal:" $(cat ./assets/chapter_1/data/animals.txt | cut -d " " -f 2 | sort | uniq -c)

# Args.
# $n access the nth argument
# $@ access all arguments
# $# access the number of arguments
