# Area Calculator:
# Create a function Calculate_area(shape, dimensions) that takes the shape
# (e.g., "rectangle", "circle") and its dimensions as arguments.
# The function should calculate the area based on the shape and return the result.
# Implement logic for handling different shapes (rectangle, circle) and their corresponding dimensions
# (length, width for rectangle; radius for circle).
import math


def calculate_area(shape, *dimension):
    if shape.lower() == "rectangle":
        return dimension[0] * dimension[1]
    elif shape.lower() == "circle":
        return f"{(math.pi * dimension[0] ** 2):.2f}"
    elif shape.lower() == "square":
        return dimension[0] ** 2
    else:
        return -1

# print(calculate_area("circle", 4, 2))

# ------------------------------------------------------------------------------------------------------------------------

# String Manipulation:
# Create a function reverse_words(text) that takes a string as input.
# The function should reverse the order of words in the string while maintaining the order of characters within each word.


def reverse_string(string):

    return

print(reverse_string("Vishal"))







