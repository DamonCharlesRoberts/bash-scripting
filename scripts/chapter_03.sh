#!/opt/homebrew/bin/bash

# If statements
#   * This is the basic if statement:
a=1
if [ $a==1 ]; then
    echo "$a==1 is true"
else
    echo "$a==1 is false"
fi
#   * Can also use other arithmatic flags.
#       ** -eq for equal to
#       ** -ne for not equal to
#       ** -lt for less than
#       ** -le for less than or equal to
#       ** -gt for greater than
#       ** -ge for grather than or equal to
a=2
if [ $a -eq 1 ]; then
    echo "$a==1 is true"
else
    echo "$a==1 is false"
fi
#   * Non-arithmatic flags.
#       ** -e if the file exists
#       ** -s if the file exists and has a size greater than zero.
#       ** -r if the file exists and is readable
#       ** -w if the file exists and is writable
#   * For multiple conditions
#       ** && for AND
#       ** || for OR
a=3
if [ $a -lt 3 ]; then
    echo "$a is less than 3."
else
    echo "$a is not less than 3."
fi
if [ $a -lt 3 ] || [ $a -eq 3 ]; then
    echo "$a is less than or equal to 3."
else
    echo "$a is not less than or equal to 3."
fi

# You can also use a shell-within-a-shell for the conditional
if [ -d ./assets/chapter_3 ]; then
    echo "Directory ./assets/chapter_3/data already exists."
else
    mkdir ./assets/chapter_3
    echo "Created directory ./assets/chapter_3"
fi
if [ -d ./assets/chapter_3/data ]; then
    echo "Directory ./assets/chapter_3/data already exists."
else
    mkdir ./assets/chapter_3/data
    echo "Created directory ./assets/chapter_3/data/"
fi
if [ -a ./assets/chapter_3/data/message.txt ]; then
    echo "File ./assets/chapter_3/data/message.txt already exists!"
else
    touch ./assets/chapter_3/data/message.txt
    echo "File ./assets/chapter_3/data/message.txt created!"
fi
if [ -w ./assets/chapter_3/data/message.txt ]; then
    echo "Hello world" > ./assets/chapter_3/data/message.txt
    echo "Content added to file ./assets/chapter_3/data/message.txt."
else
    echo "File ./assets/chapter_3/data/message.txt is not writable!"
fi
if [ -r ./assets/chapter_3/data/message.txt ]; then
    cat ./assets/chapter_3/data/message.txt
else
    echo "File .assets/chapter_3/data/message.txt is not readable!"
fi
if $(grep -q Hello ./assets/chapter_3/data/message.txt); then
    echo "Hello is inside!"
else
    echo "Hello is not inside!"
fi

# For loops
#   * Basic structure
declare -a iterable
iterable=(1 2 3)

for i in ${iterable[@]}
do
    echo $i
done

#   * For loop over a range
#       ** {START..STOP..INCREMENT}
for x in {1..5..2}
do
    echo $x
done
#   * The three expression syntax
#       ** x=2 is the start expression
#       ** x<=4 is the terminating condition
#       ** x+=2 is the increment or decrement.
for ((x=2;x<=4;x+=2))
do
    echo $x
done

for ((i=10;i>=0;i-=2))
do
    echo $i
done

# Glob
#   * Can do pattern matching with glob by using the wildcard.
#       ** For example finding the name of the files
for f in ./assets/chapter_3/data/*
do
    echo $f
done

# While loops
#   * Similar syntax for forloop except you set a condition at each iter.
x=1
while [ $x -le 3 ];
do
    echo $x
    ((x+=1))
done

# Case statements
#   * Good for situations where there are lots of complicated conditionals.
#       ** Complex if statement
# if grep -q 'sydney' $1; then
#     mv $1 sydney/
# fi
# if grep -q 'melbourne|brispane' $1; then
#     rm $1
# fi
# if grep -q 'canberra' $1; then
#     mv $1 "IMPORTANT_$1"
# fi
#       ** Rewritten as CASE statement
# case $(cat $1) in
#   *sydney*)
#   mv$1 sydney/ ;;
#   rm $1 ;;
#   *canberra*)
#   mv $1 "IMPORANT_$1" ;;
#   *)
#   echo "No cities found.";;
# esac
#   * GENERAL CASE STATEMENT PATTERN
# case 'STRINGVAR' in
#   PATTERN1)
#   COMMAND;;
#   PATTERN2)
#   COMMAND2;;
#   *) # For all others
#   DEFAULT COMMAND;; # Do this.
# esac # Then escape the case statement.
