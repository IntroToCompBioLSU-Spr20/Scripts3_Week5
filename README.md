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

## Regular Expressions

What are Regular Expressions?
  - Editing text files is one of the most common tasks in computational biology
  - Often these files contain datasets whose format needs to be changed or from which some information needs to be extracted
  - Accomplishing these tasks by hand is tedious at best, and impossible in many cases
  - Regular expressions are an advanced form of find-and-replace that can be used to manipulate complex patterns of text
  - Regular expressions are often abbreviated as `regex`
  - Regular expression syntax can be used in a variety of different programs and contexts, including Atom, `grep`, and `sed`.
  - One of the most powerful uses of regex is to reformat files. This requires finding the text patterns that you're interested in and replacing them (or adding to them).

Wildcards and Special Characters
  - Now try searching with $. What happens? Both `^` and `$` are special characters for regex.
  - Now try searching these other special character combinations: `\n`, `\s`, `\w`, `.`, and `\d`.
    - Each of these is a type of wildcard. What do they match?

Escaping special characters
  - What if you wanted to search for a literal '$' in your file? How would you do it?
  - The \ is used to "escape" these characters with special meanings. So, if you search for \$, it will match any literal dollar signs in your file.
  - Note that this is essentially the opposite of the way \ is used with regular letters (like \n). In that case, it actually _gives_ the letter meaning. But when escaping, it _takes away_ the special meaning.

Customized wildcards
  - Sometimes (often, actually) the exact wildcard you need won't be built in. Thankfully, regex includes an easy way to set up any custom wildcard. Simply put the list of characters you want to be included in your wildcard inside square brackets, like this:
    - `[AB]`
    - `[12345]`
    - `[_A56]`
  - Ranges of letters or numbers can be included in custom sets, to avoid having to type each one individually. For instance,
    - `[0-9]` matches all individual digits
    - `[A-Z]` matches all capital letters
    - `[d-h]` matches lowercase letters between d and h
    - Be careful about specifying a range that includes both uppercase and lowercase letters. You always have to start with uppercase, but notice what happens when you end with lowercase, like `[A-z]`. What unexpected characters are included? Why? Hint: check Practical Computing.
    - You can also create wildcards that match anything _except_ what you specify by adding ^ to the beginning of your wildcard descript. Note that this is different than the use of ^ to specify the beginning of a line when it's not inside square brackets. So, to find all characters that are not lower-case letters, you could use `[^a-z]`

Repeating characters
  - Often, you'll want to search for more than one instance of a particular type of character in a row. To search for one or more instances of that character, add a +.
    - `t+`
  - To look for a specific number of instances, you can follow the character with braces and the precise number of instances you're looking for.
    - `t{2}`
  - To look for zero or more instances (when you're not sure if the character will be present in any amount, but you want to match it if so), use *.
    - `A*` - This will match 0-... As. But what happens if you use only this as your search?

Capturing text in search fields
  - It's very useful to capture some portion of the text matched by a search in order to use it as part of the replacement.
  - To capture part of the search text, simply surround it with parentheses, ( and ).
  - To use the captured text in the replacement, you'll need to indicate which of the captured fields you'd like to use. Regex numbers them based on the order of the parentheses used in your search. To indicate the first captured field, use `$1`, to indicate the second captured field, use `$2`, etc.

