/*Flutter 14-Module 9 Assignment

You need to show your understanding of class, constructor, inheritance, and abstraction by solving the following problems:

1.Create a Student class with properties name and roll. Use a constructor to initialize these values and add a method
displayInfo() to print them. Create one student object and display the details.

2.Create a Person class with a property name. Then create a Teacher class that inherits from Person and adds a property
 subject. Initialize a teacher object and print both the name and subject.

3.Create an abstract class named Shape with an abstract method area(). You have to create set and get method  to access the area().
 Then create one subclass Circle with property radius that implements the area() method.
 Finally, create one circle object and print its area.*/

class Student{
  String name;
  int roll;
  Student(this.name, this.roll);
  void displayInfo(){
    print("Name: $name, Roll: $roll");
  }
}

class Person{
  String name;
  Person(this.name);

}

class Teacher extends Person{
  String subject;
  Teacher(super.name, this.subject);

  void displayInfo(){
    print("Name: $name, Subject: $subject");
  }
}

abstract class Shape {
  final double pi = 3.1416;
  double _area = 0;

  // Abstract method - no body
  double area(double radius);

  void setArea(double radius) {
    _area = area(radius);
  }

  double getArea() {
    return _area;
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area(double radius) {
    return pi * radius * radius;
  }
}

void main(){
  Student student1 = Student("zubayeer", 1);
  student1.displayInfo();

  Teacher teacher1 = Teacher("Nowsin ", "Math");
  teacher1.displayInfo();

  Circle circle1 = Circle(5);
  circle1.setArea(5);
  print("Area of the circle: ${circle1.getArea()}");
}



