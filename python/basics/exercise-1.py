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
    return string[::-1]


# print(reverse_string("Vishal"))


# ------------------------------------------------------------------------------------------------------------------------


# Create a function analyze_list(numbers) that takes a list of numbers as input.
# The function should calculate and return the following in a dictionary:
# Minimum value in the list
# Maximum value in the list
# Average value in the list (use sum and division)
# Use a dictionary to store and return the calculated statistics.

def analyze_list(arr):
    result = dict()

    result["max"] = max(arr)
    result["min"] = min(arr)
    result["avg"] = f"{sum(arr) / len(arr):.2f}"

    return result


# print(analyze_list([1, 2, 3, 4, 5]))


# ------------------------------------------------------------------------------------------------------------------------


# Filtering with Lambda:
# Create a list of product names (strings).
# Define a function filter_short_names(names, max_length) that takes the list of names and a maximum length as arguments.
# Use filter with a lambda function to return a new list containing only names shorter than the provided max_length.

def filter_short_names(names, max_length):
    filtered_names = list(filter(lambda name: len(name) > max_length, names))

    return filtered_names


# print(filter_short_names(["Vishal", "Anne", "Snow", "Joanna", "Choco", "Max", "Joe"], 5))


# ------------------------------------------------------------------------------------------------------------------------


# Text Analyzer (Bonus Challenge):
# Create a function analyze_text(text) that takes a block of text as input.
# The function should:
# Count the number of words in the text (split by whitespace).
# Count the number of characters (excluding whitespaces).
# Find the most frequent word (you can assume case-insensitive matching for simplicity).
# Return a dictionary containing these counts and the most frequent word.

def analyze_text():
    stats = dict()
    word_dict = dict()
    most_repeated = ""
    word_count = 0
    chars = 0

    try:
        with open("text1.txt", "r") as file_object:
            lines = file_object.readlines();

            for line in lines:
                for c in line.strip():
                    if not c.isspace():
                        chars += 1

                words = line.split(" ")
                for word in words:
                    word_count += 1
                    word = word.strip().lower()

                    if word not in word_dict:
                        word_dict[word] = 1
                    else:
                        word_dict[word] += 1

            max = -1
            for i, j in word_dict.items():
                if j > max:
                    max = j
                    most_repeated = i

            stats["word_count"] = word_count
            stats["character_count"] = chars
            stats["most_frequent_word"] = most_repeated

            print(stats)

    except FileExistsError or FileNotFoundError:
        print("Not able to read the file")


analyze_text()
