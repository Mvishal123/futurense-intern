my_set = {1, 2, 3, 4, 5}

# my_set.remove(10)
# my_set.discard(10)

# print(my_set.pop())
# print(my_set.pop())
# print(my_set.pop())
# print(my_set)

user_interests = {
    'Alice': {'sports', 'music', 'reading'},
    'Bob': {'movies', 'music', 'gaming'},
    'Charlie': {'sports', 'music', 'cooking'},
    'David': {'sports', 'traveling', 'photography'},
    'Emma': {'music', 'reading', 'cooking'}
}

def get_unique_interests(user_data):
    return list({interest for i in user_data.values() for interest in i })

# print(get_unique_interests(user_interests))