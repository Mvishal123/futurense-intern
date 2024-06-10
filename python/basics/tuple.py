    # fruits = ("apple", "mango", "papaya", "pineapple", "cherry")
    #
    # (green, *tropic, red) = fruits
    #
    # print(green)
    # print(tropic)
    # print(red)

# fruits = ("apple", "banana", "cherry")
# mytuple = fruits * 2
#
# print(mytuple)


# repeated_number = 5  # Number to repeat
# repetitions = 3  # Number of repetitions
#
# repeated_tuple = tuple(range(repeated_number)) * repetitions
#
# print("Tuple with repeated elements:", repeated_tuple)




# ********************************************************************************



# Q1.Accessing individual elements
fruits = ["apple", "banana", "cherry"]
first_fruit = fruits[0]  # Accesses "apple"
last_fruit = fruits[-1]  # Accesses "cherry" (negative indexing starts from the end)


# Q2.Extracting a sublist:
numbers = [1, 2, 3, 4, 5]
sublist1 = numbers[1:4]  # Extracts [2, 3, 4] (includes index 1, excludes 4)
sublist2 = numbers[2:]  # Extracts [3, 4, 5] (from index 2 to the end)

# Q3.Copying a list
original_list = [6, 7, 8]
copy_list = original_list[:]  # Creates a shallow copy


# Q4.Reversing a list:
letters = ['a', 'b', 'c', 'd']
reversed_letters = letters[::-1]  # Extracts [d, c, b, a]

# Q5.Counting occurrences in a string
message = "Hello, world! How is your day?"
count_of_o = message.count('o')  # Case-sensitive counting
print(count_of_o)  # Output: 2

