# Write a  Python program to create a class that represents a shape.
# Include methods to calculate its area and perimeter.
# Implement subclasses for different shapes like circle, triangle, and square


import math
class Shape:
    pass
class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def get_area(self):
        return math.pi * self.radius**2

    def get_perimeter(self):
        return 2 * math.pi * self.radius

class Rectangle(Shape):
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def get_area(self):
        return self.length * self.width

    def get_perimeter(self):
        return 2 * (self.length + self.width)

class Triangle(Shape):
    def __init__(self, base, height, side1, side2, side3):
        self.base = base
        self.height = height
        self.side1 = side1
        self.side2 = side2
        self.side3 = side3

    def get_area(self):
        return 0.5 * self.base * self.height

    def get_perimeter(self):
        return self.side1 + self.side2 + self.side3

circle_radius = 7
my_circle = Circle(circle_radius)
circle_area = my_circle.get_area()
circle_perimeter = my_circle.get_perimeter()


print("Circle Radius:", circle_radius)
print("Circle Area:", circle_area)
print("Circle Perimeter:", circle_perimeter)


rect_length = 5
rect_width = 7
my_rectangle = Rectangle(rect_length, rect_width)
rectangle_area = my_rectangle.get_area()
rectangle_perimeter = my_rectangle.get_perimeter()


print("\nRectangle: Length =", rect_length, " Width =", rect_width)
print("Rectangle Area:", rectangle_area)
print("Rectangle Perimeter:", rectangle_perimeter)

tri_base = 5
tri_height = 4
tri_side1 = 4
tri_side2 = 3
tri_side3 = 5


print("\nTriangle: Base =", tri_base, " Height =", tri_height, " side1 =", tri_side1, " side2 =", tri_side2, " side3 =", tri_side3)
my_triangle = Triangle(tri_base, tri_height, tri_side1, tri_side2, tri_side3)
triangle_area = my_triangle.get_area()
triangle_perimeter = my_triangle.get_perimeter()
print("Triangle Area:", triangle_area)
print("Triangle Perimeter:", triangle_perimeter)




# --------------------------------------------------------------

# Inheritance

class Animal:
  def __init__(self, name):
    self.name = name

  def make_sound(self):
    print("animal sound")

class Dog(Animal):
  def __init__(self, name, breed):
    super().__init__(name)
    self.breed = breed

  def make_sound(self):
    print("Woof! I am", self.breed)

animal = Animal("Generic")
animal.make_sound()

dog = Dog("Fido", "Labrador")
dog.make_sound()



# LIBRARY MANAGEMENT SYSTEM

class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author
        self.is_borrowed = False

    def __str__(self):
        return f"'{self.title}' by {self.author} {'(Borrowed)' if self.is_borrowed else '(Available)'}"


class User:
    def __init__(self, name):
        self.name = name
        self.borrowed_books = []

    def borrow_book(self, book):
        if not book.is_borrowed:
            book.is_borrowed = True
            self.borrowed_books.append(book)
            print(f"{self.name} borrowed {book.title}")
        else:
            print(f"Sorry, {book.title} is already borrowed.")

    def return_book(self, book):
        if book in self.borrowed_books:
            book.is_borrowed = False
            self.borrowed_books.remove(book)
            print(f"{self.name} returned {book.title}")
        else:
            print(f"{self.name} did not borrow {book.title}")

    def __str__(self):
        borrowed_titles = [book.title for book in self.borrowed_books]
        return f"{self.name} has borrowed: {', '.join(borrowed_titles)}" if borrowed_titles else f"{self.name} has not borrowed any books."


class Library:
    def __init__(self):
        self.books = []

    def add_book(self, book):
        self.books.append(book)
        print(f"Added {book.title} to the library")

    def display_books(self):
        for book in self.books:
            print(book)

    def find_book(self, title):
        for book in self.books:
            if book.title == title:
                return book
        print(f"{title} not found in the library.")
        return None

library = Library()
book1 = Book("1984", "George Orwell")
book2 = Book("To Kill a Mockingbird", "Harper Lee")
book3 = Book("The Great Gatsby", "F. Scott Fitzgerald")

library.add_book(book1)
library.add_book(book2)
library.add_book(book3)

library.display_books()

user1 = User("Alice")
user2 = User("Bob")

user1.borrow_book(book1)
user2.borrow_book(book1) 
user2.borrow_book(book2)

library.display_books()

user1.return_book(book1)
user2.borrow_book(book1)

library.display_books()
print(user1)
print(user2)
