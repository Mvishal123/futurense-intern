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
