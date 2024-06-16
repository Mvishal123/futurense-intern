# List of numbers
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Dictionary with even numbers as keys and their cubes as values
even_cubes = {num: num**3 for num in numbers}
# print(even_cubes)


# sentence = "Hello, world! Hello, Python!"
# word_counts = {}
#
# for word in sentence.split():
#     if word in word_counts:
#         word_counts[word] += 1
#     else:
#         word_counts[word] = 1



# ****************************************




# Merge Two Dictionaries
# Write a function that takes two dictionaries as input and returns a new dictionary
# that combines all the key-value pairs from both dictionaries. If a key exists in both dictionaries,
# the value from the second dictionary should overwrite the value from the first dictionary

def merge_dicts(dict1, dict2):
    merged = dict1.copy()
    merged.update(dict2)
    return merged

dict1 = {'a': 1, 'b': 2}
dict2 = {'b': 3, 'c': 4}
merged_dict = merge_dicts(dict1, dict2)
# print(merged_dict)



# Write a function that takes a dictionary
# as input and returns a new dictionary with the keys and values swapped.

def swap_key_value(dic):
    cdic = {value: key for key, value in dic.items()}
    return cdic

# print(swap_key_value(dict1)


# Write a function that takes a dictionary as input and returns
# a new dictionary with the key-value pairs sorted by value in ascending order.

def sort_value_asc(dic):
    sorted_dict = dict(sorted(dic.items(), key=lambda x: x[1]))
    return sorted_dict

unsorted_dict = {'b': 2, 'a': 1, 'c': 3}
sorted_dict = sort_value_asc(unsorted_dict)
# print(sorted_dict)




def remove_duplicate_values(dic):
    unique_dic = dict()

    for key, value in dic.items():
        if value in unique_dic.values():
            continue
        else:
            unique_dic[key] = value

    return unique_dic





original_dict = {'a': 1, 'b': 2, 'c': 1, 'd': 3, 'e': 2}
unique_dict = remove_duplicate_values(original_dict)
print(unique_dict)




def group_by_key(data, key):
    grouped = {}
    for item in data:
        value = item[key]
        if value in grouped:
            grouped[value].append(item)
        else:
            grouped[value] = [item]
    return grouped

data = [
    {'name': 'Alice', 'age': 25, 'city': 'New York'},
    {'name': 'Bob', 'age': 30, 'city': 'Chicago'},
    {'name': 'Charlie', 'age': 35, 'city': 'New York'},
    {'name': 'David', 'age': 40, 'city': 'Chicago'}
]

grouped_by_city = group_by_key(data, 'city')
print(grouped_by_city)




# def invert_dictionary(d):
#     inverted_dict = {value: key for key, value in d.items()}
#     return inverted_dict

# original_dict = {'a': 1, 'b': 2, 'c': 3}
# inverted_dict = invert_dictionary(original_dict)
# print(inverted_dict) 



def group_anagrams(words):
    anagrams = {}
    for word in words:
        sorted_word = ''.join(sorted(word))
        if sorted_word in anagrams:
            anagrams[sorted_word].append(word)
        else:
            anagrams[sorted_word] = [word]
    return list(anagrams.values())


words = ["eat", "tea", "tan", "ate", "nat", "bat"]
anagram_groups = group_anagrams(words)
print(anagram_groups) 