# # Sample list to work with
# fruits = ["apple", "banana", "cherry"]
#
# # Append
# fruits.append("orange")
# print(f"Append: {fruits}")
#
# # Insert
# fruits.insert(1, "grape")
# print(f"Insert: {fruits}")
#
# # Remove
# fruits.remove("banana")
# print(f"Remove: {fruits}")
#
# # Copy
# # Shallow Copy
# fruits_shallow_copy = fruits.copy()
# fruits_shallow_copy[0] = "lemon"
# print(f"Shallow Copy: {fruits_shallow_copy}, Original: {fruits}")
#
# # Deep Copy
# import copy
# fruits_deep_copy = copy.deepcopy(fruits)
# fruits_deep_copy[0] = "kiwi"
# print(f"Deep Copy: {fruits_deep_copy}, Original: {fruits}")
#
# # Count
# fruits.append("apple")
# apple_count = fruits.count("apple")
# print(f"Count of 'apple': {apple_count}")
#
# # Extend
# more_fruits = ["pear", "pineapple"]
# fruits.extend(more_fruits)
# print(f"Extend: {fruits}")
#
# # Index
# apple_index = fruits.index("apple")
# print(f"Index of 'apple': {apple_index}")
#
# # Sort
# fruits.sort()
# print(f"Sort: {fruits}")
#
# # Reverse
# fruits.reverse()
# print(f"Reverse: {fruits}")
#
# # Clear
# fruits.clear()
# print(f"Clear: {fruits}")
#
# #Pop
# removed_fruit = more_fruits.pop()
# print(f"Pop: {removed_fruit}, Remaining: {more_fruits}")
import functools

# *************************************************************


# # Create a list of fruits
# fruits = ["apple", "banana", "cherry", "date", "elderberry", "fig", "grape"]
#
# # Slice from index 1 to 4
# subset1 = fruits[1:4]
# print("Positive Slicing:", subset1)
#
# # Slice with a step
# subset2 = fruits[1:6:2]
# print("Positive Slicing with Step:", subset2)
#
# # Slice the last three elements
# subset3 = fruits[-3:]
# print("Negative Slicing:", subset3)
#
# # Slice from the second to last to the fourth to last
# subset4 = fruits[-2:-5:-1]
# print("Negative Slicing with Reverse:", subset4)
#
# # Extract a portion of the list
# middle_subset = fruits[2:5]
# print("Retrieve a Portion:", middle_subset)
#
# # Update elements within a slice
# fruits[1:3] = ["blueberry", "cranberry"]
# print("Update a Slice:", fruits)
#
# # Remove elements within a slice
# del fruits[2:4]
# print("Delete a Slice:", fruits)
#
# # Add elements into a specific position
# fruits[1:1] = ["kiwi", "mango"]
# print("Insert into a Slice:", fruits)

# *******************************************************

# ls = [1, 2, 3, 4, 5, 6]
# fruits = ["apple", "banana", "orange", "kiwi", "melons", "strawberry"]
# fruits2 = ["apple","banana", "orange", "kiwi", "melons", "strawberry"]
# fruits2.reverse()

# print(15 in ls)

# def max_finder(arr):
#     return functools.reduce(lambda x, y: x if y < x else y, arr)

# print(max_finder(ls))

# for x, y, z in zip(ls, fruits, fruits2):
#     print(x, y, z)



# **********************************************************************************************


# PRACTICE QUESTIONS

# List for Practice
fruits = ["apple", "banana", "cherry", "date", "elderberry"]

# Q1: Basic Operations with Lists
# Add a new fruit "fig" to the end of the list
fruits.append("fig")
print("Q1.1 - After appending 'fig':", fruits)

# Insert "grape" at the 2nd position (index 1)
fruits.insert(1, "grape")
print("Q1.2 - After inserting 'grape' at index 1:", fruits)

# Remove the first occurrence of "banana"
fruits.remove("banana")
print("Q1.3 - After removing 'banana':", fruits)

# Return the first and last element of the list
first_fruit = fruits[0]
last_fruit = fruits[-1]
print("Q1.4 - First and last fruit:", first_fruit, last_fruit)


# Q2: Indexing and Slicing
# Get the third fruit from the list
third_fruit = fruits[2]
print("Q2.1 - Third fruit:", third_fruit)

# Retrieve a slice containing the first three fruits
first_three_fruits = fruits[:3]
print("Q2.2 - First three fruits:", first_three_fruits)

# Retrieve a slice containing the last two fruits using negative indexing
last_two_fruits = fruits[-1:-3:-1]
print("Q2.3 - Last two fruits:", last_two_fruits)

# Update the second fruit to "blueberry"
fruits[1] = "blueberry"

# Q3: List Methods and Functions
numbers = [1, 2, 3, 4, 5]

# Append the number 6 to the list
numbers.append(6)
print("Q3.1 - After appending 6:", numbers)

# Insert the number 0 at the beginning of the list
numbers.insert(0, 0)
print("Q3.2 - After inserting 0 at the beginning:", numbers)

# Remove and return the last element from the list
last_element = numbers.pop()
print("Q3.3 - Last element popped:", last_element, "Remaining list:", numbers)

# Return the count of occurrences of the number 2
count_2 = numbers.count(2)
print("Q3.4 - Count of '2':", count_2)

# Return the index of the number 3
index_3 = numbers.index(3)
print("Q3.5 - Index of '3':", index_3)

# Reverse the order of the list
numbers.reverse()
print("Q3.6 - After reversing:", numbers)

# Q4: List Comprehensions
# Create a list of even numbers from 0 to 20
even_numbers = [x for x in range(21) if x % 2 == 0]
print("Q4.1 - Even numbers:", even_numbers)

# Create a list of squares of numbers from 1 to 10
squares = [x ** 2 for x in range(1, 11)]
print("Q4.2 - Squares from 1 to 10:", squares)

# Create a list of uppercase words from a list
words = ["hello", "world", "python", "lists"]
uppercased = [word.upper() for word in words]
print("Q4.3 - Uppercased words:", uppercased)

# Create a flattened list from a nested list
nested = [[1, 2], [3, 4], [5, 6]]
flattened = [j for i in nested for j in i]
print("Q4.4 - Flattened list from nested list:", flattened)

# Q5: Searching and Sorting
# Check if "cherry" is in the list of fruits
has_cherry = "cherry" in fruits
print("Q5.1 - Is 'cherry' in the list?", has_cherry)

# Find the index of "date" in the list
date_index = fruits.index("date")
print("Q5.2 - Index of 'date':", date_index)

# Sort the list of fruits in ascending order
fruits.sort()
print("Q5.3 - Fruits sorted in ascending order:", fruits)

# Sort the list of fruits in descending order
fruits.sort(reverse=True)
print("Q5.4 - Fruits sorted in descending order:", fruits)

# Q6: Special Methods
from functools import reduce

# Calculate the sum of the list using `reduce`
numbers = [1, 2, 3, 4, 5]
total_sum = reduce(lambda x, y: x + y, numbers)
print("Q6.1 - Sum of numbers using reduce:", total_sum)

# Create a list of cubes of numbers using `map`
cubes = list(map(lambda x: x ** 3, numbers))
print("Q6.2 - Cubes of numbers using map:", cubes)

# Filter out the odd numbers from a list
even_only = list(filter(lambda x: x % 2 == 0, numbers))
print("Q6.3 - Even numbers using filter:", even_only)

# Zip two lists to create pairs of names and scores
names = ["Alice", "Bob", "Charlie"]
scores = [95, 87, 92]
name_score_pairs = list(zip(names, scores))
print("Q6.4 - Zipped names and scores:", name_score_pairs)


# def remove_duplicates(lst):
#     seen = set()
#     unique_lst = []
#     for item in lst:
#         if item not in seen:
#             unique_lst.append(item)
#             seen.add(item)
#     return unique_lst


# original_list = [1, 2, 2, 3, 4, 4, 5]
# unique_list = remove_duplicates(original_list)
# print(unique_list) 

def rotate_list(lst, n):
    n = n % len(lst) 
    return lst[-n:] + lst[:-n]


original_list = [1, 2, 3, 4, 5]
rotated_list = rotate_list(original_list, 2)
print(rotated_list) 
