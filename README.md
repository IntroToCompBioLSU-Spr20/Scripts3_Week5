# Advanced Scripting in Bash

## If...Else

One of the other very important programming concepts is known as "flow control". Basically, this just means doing different things depending on current conditions. There are several ways to accomplish flow control, but probably the most common is the `if...else` statement, which looks like this:

```
if <TEST_SOMETHING>
then
  <DO_THING_1>
else
  <DO_THING_2>
fi
```

There are lots of different ways to compare values, depending on what type of values you're working with. Here is a page that lists several options: [Bash comparison operators](http://tldp.org/LDP/abs/html/comparison-ops.html). Here's one example:

```
# Defining value of numeric variable
a=2

# if...else to see if value of number is at least 3
if [ $a -lt 3 ]  # Note: this could also be ((a < 3))
then
  echo "$a is less than 3."
else
  echo "$a is NOT less than 3."
fi
```

Here's an example of combining backticks, command-line arguments, and an if...else statement to write a script that tests if a command-line argument has a certain number of characters.

```
# Recording length of word provided on command line
# What's going on with the backticks (``) here?
myWordLength=`echo -n $1 | wc -m`

# test if word is at least 5 characters
if [ $myWordLength -lt 5 ]
then
  echo "$1 is shorter than 5 characters."
else
  echo "$1 is at least 5 characters in length."
fi
```

```
Practice Exercise - If...Else

(1) Start with the script you wrote above to practice math
(2) Now add two if...else statements to check that:
  - The first number is between 3 and 7
  - The second number is between 10 and 14
(3) If either of these conditions are not met, have your script print an error message to the screen.
```

```
Practice Exercise - Nested If...Else

If...else statements can be nested inside one another. If these statements were in a script, and
you passed 8 as the command-line argument, what will happen? What if you pass a 4?

if [ $1 -le 7 ]
then
    if [ $1 -ge 3 ]
    then
        echo "Good."
    else
        echo "Not good."
    fi
else
    echo "Not good."
fi
```

### If...Elif...Else

Sometimes you may want to evaluate a series of conditions consecutively. In this case, you can use a variation on an `if...else` statement that has an extra `else if` in the middle. In these cases, the `else if` is abbreviated as `elif` and the structure could look something like this

```
if (( $1 < 2 ))
then
    echo "less than two"
elif (( $1 < 5 ))
then
    echo "between two and four"
else
    echo "greater than four"
fi
```

How is this code different than what we saw above? If we put this in a script and passed a command-line argument of `1`, what would we get? What if we passed a `4`?

You can also string together as many `elif` tests in a row as you want.

```
if (( $1 < 2 ))
then
    echo "less than two"
elif (( $1 < 5 ))
then
    echo "between two and four"
elif (( $1 < 8 ))
then
    echo "between five and seven"
else
    echo "greater than seven"
fi
```

## For Loops

One of the most common reasons to write a script is to automate something that is, at a minimum, very tedious to do manually and, at worst, completely impossible otherwise. A versatile way to incorporate repitition into a script is to use a `for` loop. `for` loops in bash have the following structure:

```
for num in 1 two 3 FOUR
do
  echo $num
done
```

Let's break this down. First, we've defined a new variabled named `num`. This variable can be named anything you want. In this case, `num` will iteratively take the value of anything included in the list that follows `in`. During each iteration, the code in between `do` and `done` will be executed. In this case, we will simply print out each of the values our variable takes, one after the other. Later, we will use `for` loops that have a whole series of commands inside the loop.

```
Practice Exercise

Write a for loop inside a script that follows these steps:

(1) Create a variable called sum and set it to 0.
(2) Loop over the integers 1 through 10.
(3) If the integer is even (2, 4, etc.), add it to sum.
(4) Once the loop is complete, print out sum.

HINT: Remember the modulo (%) operator!!
```

Double parentheses notation can also be used to write a `for` loop in a way that doesn't require you to write out every unique element in the list:

```
for ((num=1;num<=10;num++))
do
  echo $num
done
```

When written this way, the `for` loop statement has a structure like this

```
for (( <START_VALUE> ; <STOP_CONDITION> ; <LOOP_UPDATE> ))
```

The variable is initialized to the start value, updated according to the loop update, and continues until the stop condition is no longer true. The loop update (`num++`) here adds `1` to `num` each time the loop iterates. NOTE: You _don't_ precede variables with `$` inside double parentheses.

Sometimes you'll want to loop through a whole series of command-line arguments. To loop through these arguments, you can write `$@` in place of the list in your `for` statement.

```
for num in $@
do
  echo $num
done
```

```
Practice Exercise

Write a script that's similar to the one you wrote above to add even numbers. However,
this time your script should accept any number of integers as command-line arguments
and only sum the even ones. At the end, your script should print out sum.
```


```
Assignment 4

In this assignment, you will need to write scripts to process a set of files
containing alignments of DNA sequences. Each file contains DNA sequences from
a different region of the genome for a set of amniote species (e.g., mammals,
birds, and reptiles). However, as is common in many studies, we do not have the
same number of sequences in each file. First, you will need to write a script that
sorts the files and organizes them into different folders depending on how
many sequences they contain. Second, you will need to write a script that sorts
the files and organizes them into different folders depending on whether
they contain sequences from "caretta" or not.

(1) To download the alignments, use the following command:

curl -L https://github.com/IntroToCompBioLSU-Spr20/Scripts3_Week5/raw/master/alignments.tgz >> alignments.tgz

This will create a file called "alignments.tgz" in your working directory. Files
that end with ".tgz" are a compressed file type (like zip files).

(2) To uncompress the folder with the alignment files, use this command:

tar -xzf alignments.tgz

After executing this command, you should have a folder called "alignments" that
contains 248 files, each of which contains a set of sequences from different
species. View the contents of some of these alignment files. They format they use
is called Nexus, and each one has some text that says "ntax = " followed by the
number of sequences in that file. After the header lines, the files have a
separate DNA sequence on each line. Each line begins with a name indicating the
species that was sequenced, followed by the DNA sequence itself.

If you have any questions about the contents or format of these files, feel free
to email me and ask for clarification.

(3) Write a bash script that will sort these alignment files into a series of
folders. Each folder should contain only alignments with the same number of
species (e.g., 9, 10, 11, etc.). To accomplish this, please use a for loop and
at least one if..else or if...elif...else statement. There are multiple ways that
you can do this sorting, so BE SURE YOUR SCRIPT CONTAINS COMMENTS THAT MAKE IT
CLEAR HOW YOU ARE DOING THE SORTING.

(4) Write a second bash script that will sort the alignment files into those that
contain sequences from caretta and those that do not. Again, be sure to include
comments.

(5) To submit your assignment, please fork the Week 5 repository, create a folder
with your name, add your scripts to this folder, then submit a pull request to
the class page.

This assignment will be due before class ON THURSDAY, FEB. 20TH. We won't have
time to work on the assignment during class on Tuesday, but I will be available
for a few minutes after class to answer questions. As always, you are strongly
encouraged to work together, but each person's code is expected to be their own.
```
