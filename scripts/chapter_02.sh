#!/opt/homebrew/bin/bash

# Numbers.
# Need to use either expr or bc.
# expr works with integers.
echo "expr 1 + 4 is: $(expr 1 + 4)"
# expr does not work with decimals.
echo "expr 1.0 + 4.0 is: expr: not a decimal number: '1.0'"
# bc works with decimals, though.
echo "echo "1.0 + 4.0" | bc is: $(echo "1.0 + 4.0 " | bc)"
# You can also use the scale argument with bc to determine significant numbers.
echo "echo "scale=3[semi-colon] 1 / 3" | bc is: $(echo "scale=3; 1/3" | bc)"

# Variables
dog_name='Max' # No spaces!
dog_age=13 # No spaces!
echo "My dog's name is $dog_name and he is $dog_age years old."

# Arrays
#   * Declare it without any elements.
declare -a an_array
#   * add elements to it.
an_array=(1 2 3)
#   * to print all of the elements in the array:
echo "print the array elements: ${an_array[@]}"
#   * to print the length of an array
echo "length of array: ${#an_array[@]}"
#   * Changing the array elements.
an_array_updated=("${an_array[@]}") # Copy an_array.
an_array_updated[1]=100 # Set the second element to 100.
echo "Make 2 a value of 100. an_array[1]=100. $(echo ${an_array_updated[@]})"
#   * Accessing more than one array elements
echo "Select the 2nd and third elements: $(echo ${an_array[@]:1:2})"
#   * Appending to an array
an_array+=(4)
echo "Appending to an array: an_array+=(4): $(echo ${an_array[@]})"

# Associative arrays.
#   * Create an empty array.
declare -A city_details
#   * Then define the elements.
city_details=([city_name]="New York" [population]=14000000)
#   * Acces sthe keys of the array.
echo "The keys of the array: $(echo ${!city_details[@]})"
# Then print out the results.
echo "The first element of the array: $(echo ${city_details[@]})"
# Let's access the city name.
echo "Accessing the city name of the array: $(echo ${city_details[city_name]})"
